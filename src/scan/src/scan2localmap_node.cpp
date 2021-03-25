#include <chrono>
#include <cmath>
#include <math.h>
#include <signal.h>
#include <algorithm>

#include "ros/ros.h"
#include <geometry_msgs/PolygonStamped.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Point32.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/Path.h>
#include <laser_geometry/laser_geometry.h>
#include <sensor_msgs/LaserScan.h>
#include <sensor_msgs/PointCloud2.h>
#include <walker_msgs/Trk3DArray.h>
#include <walker_msgs/Trk3D.h>
#include <std_msgs/Float32.h>

// TF
#include <tf/transform_listener.h>
#include "tf/transform_datatypes.h"

// PCL
#include <pcl_ros/transforms.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/common/common.h>
#include <pcl_conversions/pcl_conversions.h> // ros2pcl
#include <pcl/filters/crop_box.h>
#include <pcl/filters/passthrough.h>

#include "Astar.hpp"

using namespace std;

typedef pcl::PointCloud<pcl::PointXYZ> PointCloudXYZ;
typedef pcl::PointCloud<pcl::PointXYZ>::Ptr PointCloudXYZPtr;
typedef pcl::PointCloud<pcl::PointXYZRGB> PointCloudXYZRGB;
typedef pcl::PointCloud<pcl::PointXYZRGB>::Ptr PointCloudXYZRGBPtr;


template<class ForwardIterator>
inline size_t argmin(ForwardIterator first, ForwardIterator last) {
    return std::distance(first, std::min_element(first, last));
}

template<class ForwardIterator>
inline size_t argmax(ForwardIterator first, ForwardIterator last) {
    return std::distance(first, std::max_element(first, last));
}


class Scan2LocalmapNode {
public:
    Scan2LocalmapNode(ros::NodeHandle nh, ros::NodeHandle pnh);
    static void sigint_cb(int sig);
    void butterworth_filter(vector<int8_t> &vec, int map_width, int map_height, int target_idx, int peak_value);
    void asymmetric_gaussian_filter(vector<int8_t> &vec, double map_resolution, int map_width, int map_height, int target_idx, double target_yaw, double target_speed, int peak_value);
    void butterworth_filter_generate(double filter_radius, int filter_order, double map_resolution, int peak_value);
    void scan_cb(const sensor_msgs::PointCloud2 cloud_msg);
    void trk_cb(const walker_msgs::Trk3DArray::ConstPtr &msg_ptr);
    int get_cost(vector<int8_t> vec, int map_width, int map_height, int target_idx);
    geometry_msgs::Point generate_sub_goal(nav_msgs::OccupancyGrid::Ptr &map_msg_ptr, tf::StampedTransform tf_base2odom);
    bool is_footprint_safe(nav_msgs::OccupancyGrid::Ptr &map_msg_ptr, geometry_msgs::PolygonStamped::Ptr &footprint_ptr);
    bool is_path_safe(nav_msgs::OccupancyGrid::Ptr &map_msg_ptr, nav_msgs::Path::Ptr path_ptr, tf::StampedTransform tf_base2odom);

    // ROS related
    ros::NodeHandle nh_, pnh_;
    ros::Subscriber sub_scan_;
    ros::Subscriber sub_trk_;
    ros::Publisher pub_map_;
    ros::Publisher pub_footprint_;
    ros::Publisher pub_walkable_path_;
    ros::Publisher pub_marker_array_;
    string localmap_frameid_;                               // Localmap frame_id
    nav_msgs::OccupancyGrid::Ptr localmap_ptr_;             // Localmap msg
    geometry_msgs::PolygonStamped::Ptr footprint_ptr_;      // Robot footprint
    nav_msgs::Path::Ptr walkable_path_ptr_;
    string path_frame_id_;

    // TF listener
    tf::TransformListener* tflistener_ptr_;
    tf::StampedTransform tf_base2odom_;    

    // Sub-goal related
    visualization_msgs::Marker mkr_subgoal_candidate_;
    visualization_msgs::Marker mrk_subgoal_;
    double subgoal_timer_interval_;
    double solver_timeout_ms_; 
    bool flag_planning_busy_;

    // Inflation filter kernel
    vector<vector<int8_t> > inflation_kernel_;

    // Feedback of path tracking module 
    double tracking_progress_percentage_ = 0;      // to check the progress of tracking module

    // A* clever trick
    double path_start_offsetx_;
    double path_start_offsety_;
};


Scan2LocalmapNode::Scan2LocalmapNode(ros::NodeHandle nh, ros::NodeHandle pnh): nh_(nh), pnh_(pnh) {
    // Signal handler
    signal(SIGINT, Scan2LocalmapNode::sigint_cb);

    // ROS parameters
    double inflation_radius;
    double map_resolution;
    double localmap_range;
    ros::param::param<double>("~inflation_radius", inflation_radius, 0.2);
    ros::param::param<double>("~map_resolution", map_resolution, 0.1);
    ros::param::param<double>("~localmap_range", localmap_range, 16.0);
    ros::param::param<string>("~localmap_frameid", localmap_frameid_, "base_link");
    // ROS parameters
    ros::param::param<double>("~solver_timeout_ms", solver_timeout_ms_, 100.0);
    ros::param::param<double>("~subgoal_timer_interval", subgoal_timer_interval_, 0.5);
    ros::param::param<double>("~path_start_offsetx", path_start_offsetx_, 0.44);    // trick: start path from robot front according to the robot footprint
    ros::param::param<double>("~path_start_offsety", path_start_offsety_, 0.0);
    // Fixed parameters
    ros::param::param<string>("~path_frame_id", path_frame_id_, "odom_filtered");

    // ROS publishers & subscribers
    //sub_scan_ = nh_.subscribe("/scan_pointcloud_filtered", 1, &Scan2LocalmapNode::scan_cb, this);
    sub_scan_ = nh_.subscribe("trk3d_result", 1,&Scan2LocalmapNode::trk_cb, this);
    pub_map_ = nh_.advertise<nav_msgs::OccupancyGrid>("local_map", 1);
    pub_footprint_ = nh_.advertise<geometry_msgs::PolygonStamped>("footprint", 1);
    pub_walkable_path_ = nh_.advertise<nav_msgs::Path>("walkable_path", 1);
    pub_marker_array_ = nh_.advertise<visualization_msgs::MarkerArray>("path_vis", 1);


    // Prepare the transformation matrix from camera to base
    tflistener_ptr_ = new tf::TransformListener();
    ROS_INFO("Wait for TF from camera to %s in 10 seconds...", localmap_frameid_.c_str());
    try{
        tflistener_ptr_->waitForTransform(localmap_frameid_, "odom_filtered",
                                    ros::Time(), ros::Duration(10.0));
        tflistener_ptr_->lookupTransform(localmap_frameid_, "odom_filtered",
                                    ros::Time(), tf_base2odom_);
        ROS_INFO("Done.");
    }
    catch (tf::TransformException ex){
        ROS_ERROR("\nCannot get TF from camera to %s: %s. Aborting...", localmap_frameid_.c_str(), ex.what());
        exit(-1);
    }


    // Initialize localmap meta information
    localmap_ptr_ = nav_msgs::OccupancyGrid::Ptr(new nav_msgs::OccupancyGrid());
    localmap_ptr_->info.width = localmap_range * 2 / map_resolution;
    localmap_ptr_->info.height = localmap_range  / map_resolution;
    localmap_ptr_->info.resolution = map_resolution;
    localmap_ptr_->info.origin.position.x = -localmap_ptr_->info.resolution * localmap_ptr_->info.width / 2;
    localmap_ptr_->info.origin.position.y = -localmap_ptr_->info.resolution * localmap_ptr_->info.height / 2;
    localmap_ptr_->info.origin.orientation.w = 1.0;
    localmap_ptr_->data.resize(localmap_ptr_->info.width * localmap_ptr_->info.height);
    localmap_ptr_->header.frame_id = localmap_frameid_;
    ROS_INFO("Default range of localmap:+-%.1f m, size:%dx%d", 
                localmap_range, localmap_ptr_->info.width, localmap_ptr_->info.height);
    

    //walker's footprint
    // Footprint generator
    footprint_ptr_ = geometry_msgs::PolygonStamped::Ptr(new geometry_msgs::PolygonStamped());
    footprint_ptr_->header.frame_id = localmap_frameid_;
    geometry_msgs::Point32 pt;
    pt.x = -0.1, pt.y = 0.3314, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.3, pt.y = 0.3314, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.4414, pt.y = 0.19, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.4414, pt.y = -0.19, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.3, pt.y = -0.3314, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = -0.1, pt.y = -0.3314, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = -0.1, pt.y = -0.2014, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.25, pt.y = -0.2014, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.3561, pt.y = -0.0953, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.3561, pt.y = 0.0953, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = 0.25, pt.y = 0.2014, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);
    pt.x = -0.1, pt.y = 0.2014, pt.z = 0.0;
    footprint_ptr_->polygon.points.push_back(pt);


    // Marker init
    mkr_subgoal_candidate_.header.frame_id = "base_link";
    mkr_subgoal_candidate_.ns = "subgoal_candidate";
    mkr_subgoal_candidate_.type = visualization_msgs::Marker::LINE_LIST;
    mkr_subgoal_candidate_.action = visualization_msgs::Marker::ADD;
    mkr_subgoal_candidate_.pose.orientation.w = 1.0;
    mkr_subgoal_candidate_.scale.x = 0.05;
    mkr_subgoal_candidate_.color.a = 0.2; // Don't forget to set the alpha!
    mkr_subgoal_candidate_.color.r = 1.0;
    mkr_subgoal_candidate_.color.g = 1.0;
    mkr_subgoal_candidate_.color.b = 1.0;
    mkr_subgoal_candidate_.lifetime = ros::Duration(2.0);

    mrk_subgoal_.header.frame_id = path_frame_id_;
    mrk_subgoal_.ns = "subgoal";
    mrk_subgoal_.type = visualization_msgs::Marker::SPHERE;
    mrk_subgoal_.action = visualization_msgs::Marker::ADD;
    mrk_subgoal_.pose.orientation.w = 1.0;
    mrk_subgoal_.scale.x = 0.4;
    mrk_subgoal_.scale.y = 0.4;
    mrk_subgoal_.scale.z = 0.4;
    mrk_subgoal_.color.a = 0.8;
    mrk_subgoal_.color.g = 1.0;
    mrk_subgoal_.lifetime = ros::Duration(2.0);
    mrk_subgoal_.id = 0;



    // Filter kernel generator
    butterworth_filter_generate(inflation_radius, 6, map_resolution, 100);
}

bool Scan2LocalmapNode::is_footprint_safe(nav_msgs::OccupancyGrid::Ptr &map_msg_ptr, geometry_msgs::PolygonStamped::Ptr &footprint_ptr) {
    double map_resolution = map_msg_ptr->info.resolution;
    double map_origin_x = map_msg_ptr->info.origin.position.x;
    double map_origin_y = map_msg_ptr->info.origin.position.y;
    for(int i = 0; i < footprint_ptr->polygon.points.size(); i++){
        int map_x = std::round(footprint_ptr->polygon.points[i].x - map_origin_x) / map_resolution;
        int map_y = std::round(footprint_ptr->polygon.points[i].y - map_origin_y) / map_resolution;
        int idx = map_y * map_msg_ptr->info.width + map_x;
        if(map_msg_ptr->data[idx] >= 80 || map_msg_ptr->data[idx] < 0) {
            return false;
        }
    }
    return true;
}

bool Scan2LocalmapNode::is_path_safe(nav_msgs::OccupancyGrid::Ptr &map_msg_ptr, nav_msgs::Path::Ptr path_ptr, tf::StampedTransform tf_base2odom) {
    double map_resolution = map_msg_ptr->info.resolution;
    double map_origin_x = map_msg_ptr->info.origin.position.x;
    double map_origin_y = map_msg_ptr->info.origin.position.y;
    int map_width = map_msg_ptr->info.width;
    int map_height = map_msg_ptr->info.height;

    if(!path_ptr || path_ptr->poses.size() == 0){
        // ROS_WARN("Empty path, skip");
        return false;
    }

    // Transformation matrix from odom to baselink (for localmap check)
    tf::Matrix3x3 rot_odom2base = tf_base2odom.getBasis().transpose();
    tf::Vector3 tras_odom2base = rot_odom2base * tf_base2odom.getOrigin() * (-1);
    
    for(std::vector<geometry_msgs::PoseStamped>::iterator it = path_ptr->poses.begin() ; it != path_ptr->poses.end(); ++it) {
        tf::Matrix3x3 mat_raw(tf::Quaternion(it->pose.orientation.x, it->pose.orientation.y, it->pose.orientation.z, it->pose.orientation.w));
        tf::Vector3 vec_raw(it->pose.position.x, it->pose.position.y, it->pose.position.z);

        tf::Matrix3x3 mat_transformed = rot_odom2base * mat_raw;
        tf::Vector3 vec_transformed = rot_odom2base * vec_raw + tras_odom2base;

        int map_x = std::round((vec_transformed.getX() - map_origin_x) / map_resolution);
        int map_y = std::round((vec_transformed.getY() - map_origin_y) / map_resolution);
        int idx = map_y * map_width + map_x;
        if(map_msg_ptr->data[idx] >= 60 || map_msg_ptr->data[idx] < 0) {
            return false;
        }
    }

    return true;
}


geometry_msgs::Point Scan2LocalmapNode::generate_sub_goal(nav_msgs::OccupancyGrid::Ptr &map_msg_ptr, tf::StampedTransform tf_base2odom) {
    double map_resolution = map_msg_ptr->info.resolution;
    double map_origin_x = map_msg_ptr->info.origin.position.x;
    double map_origin_y = map_msg_ptr->info.origin.position.y;
    int map_width = map_msg_ptr->info.width;
    int map_height = map_msg_ptr->info.height;
    // int map_limit = map_width * map_height;

    tf::Vector3 trans_base2odom = tf_base2odom.getOrigin();
    tf::Matrix3x3 rot_base2odom = tf_base2odom.getBasis();

    // Marker reset
    visualization_msgs::MarkerArray mrk_array;
    mkr_subgoal_candidate_.header.frame_id = map_msg_ptr->header.frame_id;
    mkr_subgoal_candidate_.points.clear();  

    // Sub-goal candidates
    std::vector<double> candidate_score_list;
    double prefer_subgoal_distance = 4.0;
    double distance_resolution = map_resolution * 4;

    for(int i = 7; i >= 3; i--) {
        double theta_from_yaxis = M_PI / 12 * (i+1);
        int max_distance_idx = std::round(prefer_subgoal_distance / distance_resolution);
        double tmp_dis;
        for(int j = 3; j <= max_distance_idx; j++) {
            tmp_dis = distance_resolution * j;
            int map_x = std::round((tmp_dis * std::sin(theta_from_yaxis) - map_origin_x + path_start_offsetx_) / map_resolution);
            int map_y = std::round((tmp_dis * std::cos(theta_from_yaxis) - map_origin_y + path_start_offsety_) / map_resolution);
            int idx = map_y * map_width + map_x;
            if(get_cost((map_msg_ptr->data), map_width, map_height, idx) > 50 || idx >= map_width * map_height || map_msg_ptr->data[idx] == -1) {
                tmp_dis -= distance_resolution * 3;
                break;
            }
        }
        // Calculate score
        double score = tmp_dis / prefer_subgoal_distance * std::sin(theta_from_yaxis);
        candidate_score_list.push_back(score);

        // Visualization
        geometry_msgs::Point pt;
        pt.x = path_start_offsetx_;
        pt.y = path_start_offsety_;
        mkr_subgoal_candidate_.points.push_back(pt);    // Origin point
        mkr_subgoal_candidate_.id = i;
        pt.x += tmp_dis * std::sin(theta_from_yaxis);
        pt.y += tmp_dis * std::cos(theta_from_yaxis);
        mkr_subgoal_candidate_.points.push_back(pt);
    }
    mkr_subgoal_candidate_.header.stamp = ros::Time();
    mrk_array.markers.push_back(mkr_subgoal_candidate_);    

    // Find the farthest walkable space
    int index = argmax(candidate_score_list.begin(), candidate_score_list.end());
    // Convert goal point from base_link coordinate to odom coordinate
    tf::Vector3 subgoal_vec(mkr_subgoal_candidate_.points[index * 2 + 1].x, 
                            mkr_subgoal_candidate_.points[index * 2 + 1].y, 
                            mkr_subgoal_candidate_.points[index * 2 + 1].z);
    subgoal_vec = rot_base2odom * subgoal_vec + trans_base2odom;
    mrk_subgoal_.pose.position.x = subgoal_vec.getX();
    mrk_subgoal_.pose.position.y = subgoal_vec.getY();
    mrk_subgoal_.header.stamp = ros::Time();
    mrk_array.markers.push_back(mrk_subgoal_);
    
    // Publish marker array
    pub_marker_array_.publish(mrk_array);

    geometry_msgs::Point subgoal_pt;
    subgoal_pt.x = mkr_subgoal_candidate_.points[index * 2 + 1].x;
    subgoal_pt.y = mkr_subgoal_candidate_.points[index * 2 + 1].y;
    return subgoal_pt;
}


int Scan2LocalmapNode::get_cost(vector<int8_t> vec, int map_width, int map_height, int target_idx) {
    int kernel_size = 5;
    int bound = kernel_size / 2;
    int cost = 0;
    for(int y = -bound; y <= bound; y++) {
        for (int x = -bound; x <= bound; x++) {
            int op_idx = target_idx + x + map_width * y;
            if(op_idx < 0 || op_idx > map_width * map_height) continue;           // upper and bottom bound
            else if(abs((op_idx % map_width) - (target_idx % map_width)) > bound) continue;  // left and right bound
            else 
                cost += vec[op_idx];
        }
    }
    return cost / (kernel_size * kernel_size);
}

void Scan2LocalmapNode::asymmetric_gaussian_filter(vector<int8_t> &vec, double map_resolution, int map_width, int map_height, int target_idx, double target_yaw, double target_speed, int peak_value) {


    if(peak_value>100)
        peak_value=100;
    // Gaussian Filter kernel
    vector<vector<int8_t> > agf_kernel;
    // double kernel_range = 2.4 * 2;
    double kernel_range = 5 * 2;
    double max_kernel_range = kernel_range / 2 * 1.0000001;
    for(double y = -kernel_range / 2 ; y <= max_kernel_range; y += map_resolution){
        vector<int8_t> tmp_row;
        for(double x = -kernel_range / 2; x <= max_kernel_range; x += map_resolution){
            double sigma_head = 0.75;
            // double sigma_head = 0.5;
            double sigma_side = sigma_head * 2 / 5;
            double sigma_rear = sigma_head / 2;

            double alpha = atan2(-y, -x) - target_yaw - M_PI * 0.5;
            double alpha_prime = atan2(sin(alpha), cos(alpha));
            double sigma_front = (alpha_prime > 0)? sigma_head : sigma_rear;
            double sin_p2 = pow(sin(target_yaw), 2);
            double cos_p2 = pow(cos(target_yaw), 2);
            double sigma_side_p2 = pow(sigma_side, 2);
            double sigma_front_p2 = pow(sigma_front, 2);
            double g_a = cos_p2 / (2 * sigma_front_p2) + sin_p2 / (2 * sigma_side_p2);
            double g_b = sin(2 * target_yaw) / (4 * sigma_front_p2) - sin(2 * target_yaw) / (4 * sigma_side_p2);
            double g_c = sin_p2 / (2 * sigma_front_p2) + cos_p2 / (2 * sigma_side_p2);
            double z = 1.0 / exp(g_a * pow(x, 2) + 2 * g_b * x * y + g_c * pow(y, 2)) * peak_value;
            tmp_row.push_back(z);
        }
        agf_kernel.push_back(tmp_row);
    }


    agf_kernel[agf_kernel.size() / 2][agf_kernel[0].size() / 2] = peak_value;

    
    int kernel_size = agf_kernel.size();
    int bound = agf_kernel.size() / 2;

    int min_bound = -bound;
    int max_bound = (bound + kernel_size % 2);
    int max_map_idx = map_width * map_height;
    for(int y = min_bound; y < max_bound; y++) {
        for (int x = min_bound; x < max_bound; x++) {
            int op_idx = target_idx + x + map_width * y;
            int8_t op_kernel_val = agf_kernel[y + bound][x + bound];

            // if(vec[op_idx] < 0) continue;                                 // do not apply filter out of laser range
            if(op_kernel_val == 0 || vec[op_idx] >= op_kernel_val) continue;
            else if((target_idx % map_width + x) < map_width/2 ) continue; 
            else if(op_idx < 0 || op_idx > max_map_idx) continue;          // upper and bottom bound
            else if(abs((op_idx % map_width) - (target_idx % map_width)) > bound) continue;  // left and right bound
            else{
                //int tmp_val = op_kernel_val + vec[op_idx];
                vec[op_idx] = (op_kernel_val >= 100)? 100 : op_kernel_val;
            }
        }
    }


}


void Scan2LocalmapNode::butterworth_filter(vector<int8_t> &vec, int map_width, int map_height, int target_idx, int peak_value) {
    int kernel_size = inflation_kernel_.size();
    int bound = inflation_kernel_.size() / 2;
    for(int y = -bound; y <= bound; y++) {
        for (int x = -bound; x <= bound; x++) {
            int op_idx = target_idx + x + map_width * y;
            // if(vec[op_idx] < 0) continue;                                 // do not apply filter out of laser range
            if(inflation_kernel_[y + bound][x + bound] == 0 || vec[op_idx] >= inflation_kernel_[y + bound][x + bound]) continue;
            else if(op_idx < 0 || op_idx > map_width * map_height) continue;           // upper and bottom bound
            else if(abs((op_idx % map_width) - (target_idx % map_width)) > bound) continue;  // left and right bound
            else 
                vec[op_idx] = inflation_kernel_[y + bound][x + bound];
        }
    }
}

//generate a filter kernel with  butterworth_filter
void Scan2LocalmapNode::butterworth_filter_generate(double filter_radius, int filter_order, double map_resolution, int peak_value) {
    double kernel_range = filter_radius * 4;
    cout << "Filter kernel:" << endl;
    for(double y = -kernel_range / 2 ; y <= kernel_range / 2 * 1.00000001; y += map_resolution){
        vector<int8_t> tmp_row;
        for(double x = -kernel_range / 2; x <= kernel_range / 2 * 1.00000001; x += map_resolution){
            double r = sqrt(x * x + y * y);
            double z = (1 / sqrt(1 + pow(r / filter_radius, (2 * filter_order)))) * peak_value;
            tmp_row.push_back(z);
        }
        inflation_kernel_.push_back(tmp_row);
    }

    for(int i = 0; i < inflation_kernel_.size(); i++){
        for(int j = 0; j < inflation_kernel_[i].size(); j++){
            if(i == inflation_kernel_.size() / 2 && j == inflation_kernel_[0].size() / 2)
                inflation_kernel_[i][j] = peak_value;
            printf("%3d,", inflation_kernel_[i][j]);
        }
        cout << endl;
    }

    cout << "Inflation kernel size: (" << inflation_kernel_.size() << ", " << inflation_kernel_[0].size() << ")" << endl;
    //check if the kernel size is odd
    if(inflation_kernel_.size() % 2 == 0){
        ROS_ERROR("Even kernel size! Please assign the new filter radius so that it can generate odd kernel size");
        exit(-1);
    }
}
void Scan2LocalmapNode::trk_cb(const walker_msgs::Trk3DArray::ConstPtr &msg_ptr) {


    sensor_msgs::PointCloud2 cloud_msg = msg_ptr->pointcloud;
    // Convert  ROS PointCloud2 --> PCL PointCloudXYZ
    PointCloudXYZPtr cloud_raw(new PointCloudXYZ);
    PointCloudXYZPtr cloud_transformed(new PointCloudXYZ);
    pcl::fromROSMsg(cloud_msg, *cloud_transformed);
    //pcl_ros::transformPointCloud(*cloud_raw, *cloud_transformed, tf_base2camera_);
    //apply filter
    PointCloudXYZPtr cloud_filtered(new PointCloudXYZ);
    pcl::PassThrough<pcl::PointXYZ> pass;
    pass.setInputCloud(cloud_transformed);
    pass.setFilterFieldName("y");
    pass.setFilterLimits(0.3,0.4);
    pass.setFilterLimitsNegative(false);
    pass.filter (*cloud_filtered);
    for(int i = 0; i < cloud_filtered->points.size(); i++) {
       
        cloud_filtered->points[i].y=0;
        
    }

    // Localmap init
    fill(localmap_ptr_->data.begin(), localmap_ptr_->data.end(), 0);

    double resolution = localmap_ptr_->info.resolution;
    double map_origin_x = localmap_ptr_->info.origin.position.x;
    double map_origin_y = localmap_ptr_->info.origin.position.y;
    int map_width = localmap_ptr_->info.width;
    int map_height = localmap_ptr_->info.height;
    int map_limit = map_width * map_height;
    int count=0;
    for(int i = 0; i < cloud_filtered->points.size(); i++) {
        double laser_x = cloud_filtered->points[i].z+0.51;
        double laser_y = -cloud_filtered->points[i].x;
        //check if point is out of range
        if(fabs(laser_x) > map_height * resolution / 2)
            continue;
        else if(fabs(laser_y) > map_width * resolution / 2)
            continue;

        // Add wall(non-walkable) space
        int map_x = round((laser_x - map_origin_x) / resolution);
        int map_y = round((laser_y - map_origin_y) / resolution);
        int idx = map_y * map_width + map_x;
        
        if((0 < idx) && (idx < map_limit)){
            if(localmap_ptr_->data[idx] == 100)
                continue;
            butterworth_filter(localmap_ptr_->data, map_width, map_height, idx, 100);
            count++;

        }
    }
    cout<< cloud_filtered->points.size()<<endl;
    cout<<"count"<<count<<endl;
    
    try{
        tflistener_ptr_->waitForTransform(localmap_frameid_, "odom_filtered",
                                    ros::Time(), ros::Duration(0));
        tflistener_ptr_->lookupTransform(localmap_frameid_, "odom_filtered",
                                    ros::Time(), tf_base2odom_);
    }
    catch (tf::TransformException ex){
       
        exit(-1);
    }
    
    // Proxemics generation
    for(int i = 0; i < msg_ptr->trks_list.size(); i++) {
        
        for(int j=0;j<20;j++)
        {
            //cout << msg_ptr->trks_list[i].x << endl;
            tf::Vector3 pt_laser(msg_ptr->trks_list[i].x+msg_ptr->trks_list[i].vx*j*0.2, msg_ptr->trks_list[i].y+msg_ptr->trks_list[i].vy*j*0.2, 0);
            // tf::Vector3 pt_base = tf_base2odom_.getBasis() * pt_laser + tf_base2odom_.getOrigin();
            tf::Vector3 pt_base = tf_base2odom_ * pt_laser;
            tf::Quaternion q;
            // q.setRPY(0, 0, msg_ptr->trks_list[i].yaw);
            double yaw, pitch, roll;
            // tf::Matrix3x3 mat(q);
            // mat = tf_base2camera_.getBasis() * mat;
            // mat.getEulerYPR(yaw, pitch, roll);

            double speed = hypot(msg_ptr->trks_list[i].vx, msg_ptr->trks_list[i].vy);
            if(speed > 0.5)
                speed = 0.5;
            double dangerous = 200*msg_ptr->trks_list[i].dangerous;
            // Calculate object position in local map
            
            int map_x = round((pt_base.getX()- map_origin_x) / resolution);
            int map_y = round((pt_base.getY()- map_origin_y) / resolution);
            int idx = map_y * map_width + map_x;

            if((0 < idx) && (idx < map_limit) && (speed > 0.15)){
                asymmetric_gaussian_filter(localmap_ptr_->data, resolution, map_width, map_height, idx, msg_ptr->trks_list[i].yaw, speed,dangerous*(1-0.02*j));
            }
            else if((0 < idx) && (idx < map_limit) && (speed <= 0.15)){
                yaw = atan2(-pt_base.getY(),-pt_base.getX());
                asymmetric_gaussian_filter(localmap_ptr_->data, resolution, map_width, map_height, idx, yaw, speed,dangerous);
            }
            
        }



        
    }

    // Publish localmap
    ros::Time now = ros::Time(0);
    localmap_ptr_->header.stamp = now;
    pub_map_.publish(*localmap_ptr_);

    // Publish footprint
    footprint_ptr_->header.stamp = now;
    pub_footprint_.publish(*footprint_ptr_);

    if(!localmap_ptr_){
        ROS_WARN("Empty local map, skip");
    } else{
        // std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
        double map_resolution = localmap_ptr_->info.resolution;
        double map_origin_x = localmap_ptr_->info.origin.position.x;
        double map_origin_y = localmap_ptr_->info.origin.position.y;
        int map_width = localmap_ptr_->info.width;
        int map_height = localmap_ptr_->info.height;
    

       
        tf::Matrix3x3 rot_base2odom = tf_base2odom_.getBasis().transpose();
        tf::Vector3 trans_base2odom = rot_base2odom * tf_base2odom_.getOrigin();

        if(!is_footprint_safe(localmap_ptr_, footprint_ptr_)) {
            ROS_ERROR("Collision detected!!");
            walkable_path_ptr_ = nav_msgs::Path::Ptr(new nav_msgs::Path());
            walkable_path_ptr_->header.stamp = ros::Time();
            pub_walkable_path_.publish(walkable_path_ptr_);
            flag_planning_busy_ = false;
            return;
        }
        else if((walkable_path_ptr_)&&(is_path_safe(localmap_ptr_, walkable_path_ptr_, tf_base2odom_)))
        {
            walkable_path_ptr_->header.stamp = ros::Time();
            pub_walkable_path_.publish(walkable_path_ptr_);
            flag_planning_busy_ = false;
            return;
        }
        else
        {
            geometry_msgs::Point subgoal_pt;
            if(walkable_path_ptr_){
                // Unsafe path situation
                subgoal_pt = generate_sub_goal(localmap_ptr_, tf_base2odom_);
                ROS_WARN("Old path is not safe, generate new goal: (%.2f, %.2f)", subgoal_pt.x, subgoal_pt.y);
            }
            else{
                // New plan situation
                subgoal_pt = generate_sub_goal(localmap_ptr_, tf_base2odom_);
                ROS_WARN("No any old path,    start plan...");
            }


            if(std::hypot(subgoal_pt.x - path_start_offsetx_, subgoal_pt.y - path_start_offsety_) < 0.2){
                walkable_path_ptr_ = nav_msgs::Path::Ptr(new nav_msgs::Path());
                walkable_path_ptr_->header.stamp = ros::Time();
                pub_walkable_path_.publish(walkable_path_ptr_);
                flag_planning_busy_ = false;
                return;
            }
        

            // A* path planning
            walkable_path_ptr_ = nav_msgs::Path::Ptr(new nav_msgs::Path());
            walkable_path_ptr_->header.frame_id = path_frame_id_;
            Astar::Solver solver;
            
            
            // subgoal_pt.x = 3;
            // subgoal_pt.y = 0;
            // coordinate to map grid
            // Trick: start plan from the grid which is in front of robot
            int origin_idx = std::round((-map_origin_y + path_start_offsety_) / map_resolution) * map_width + 
                                std::round((-map_origin_x + path_start_offsetx_) / map_resolution);
            int map_x = std::round((subgoal_pt.x - map_origin_x) / map_resolution);
            int map_y = std::round((subgoal_pt.y - map_origin_y) / map_resolution);
            int target_idx = map_y * map_width + map_x;

            bool flag_success = solver.solve_ros(localmap_ptr_, walkable_path_ptr_, origin_idx, target_idx, solver_timeout_ms_);
            if(flag_success){
                // Convert path from base_link coordinate to odom coordinate
                for(std::vector<geometry_msgs::PoseStamped>::iterator it = walkable_path_ptr_->poses.begin() ; it != walkable_path_ptr_->poses.end(); ++it) {
                    tf::Matrix3x3 mat_raw(tf::Quaternion(it->pose.orientation.x, it->pose.orientation.y, it->pose.orientation.z, it->pose.orientation.w));
                    tf::Vector3 vec_raw(it->pose.position.x, it->pose.position.y, it->pose.position.z);
                    
                    tf::Matrix3x3 mat_transformed = rot_base2odom * mat_raw;
                    tf::Vector3 vec_transformed = rot_base2odom * vec_raw + trans_base2odom;
                    it->pose.position.x = vec_transformed.getX();
                    it->pose.position.y = vec_transformed.getY();
                    it->pose.position.z = vec_transformed.getZ();
                }
                walkable_path_ptr_->header.stamp = ros::Time();
                pub_walkable_path_.publish(walkable_path_ptr_);
            }
            else{
                // Publish empty path if there are no path finding solution.
                ROS_WARN("No solution for path finding in timeout: %.1f ms", solver_timeout_ms_);
                walkable_path_ptr_->header.stamp = ros::Time();
                pub_walkable_path_.publish(walkable_path_ptr_);
            }
        
        }        

    }


}


void Scan2LocalmapNode::sigint_cb(int sig) {
    cout << "\nNode name: " << ros::this_node::getName() << " is shutdown." << endl;
    // All the default sigint handler does is call shutdown()
    ros::shutdown();
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "camera_mapping_node");
    ros::NodeHandle nh, pnh("~");
    Scan2LocalmapNode node(nh, pnh);    
    ros::spin();
    return 0;
}
