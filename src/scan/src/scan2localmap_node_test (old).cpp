#include <chrono>
#include <cmath>
#include <math.h>
#include <signal.h>

#include "ros/ros.h"
#include <geometry_msgs/PolygonStamped.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Point32.h>
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Odometry.h>
#include <laser_geometry/laser_geometry.h>
#include <sensor_msgs/LaserScan.h>
#include <sensor_msgs/PointCloud2.h>
#include <walker_msgs/Trk3DArray.h>
#include <walker_msgs/Trk3D.h>

// TF
#include <tf/transform_listener.h>

// PCL
#include <pcl_ros/transforms.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/common/common.h>
#include <pcl_conversions/pcl_conversions.h> // ros2pcl
#include <pcl/filters/crop_box.h>
#include <pcl/filters/passthrough.h>

using namespace std;

typedef pcl::PointCloud<pcl::PointXYZ> PointCloudXYZ;
typedef pcl::PointCloud<pcl::PointXYZ>::Ptr PointCloudXYZPtr;
typedef pcl::PointCloud<pcl::PointXYZRGB> PointCloudXYZRGB;
typedef pcl::PointCloud<pcl::PointXYZRGB>::Ptr PointCloudXYZRGBPtr;


class Scan2LocalmapNode {
public:
    Scan2LocalmapNode(ros::NodeHandle nh, ros::NodeHandle pnh);
    static void sigint_cb(int sig);
    void butterworth_filter(vector<int8_t> &vec, int map_width, int map_height, int target_idx, int peak_value);
    //void asymmetric_gaussian_filter(vector<int8_t> &vec, double map_resolution, int map_width, int map_height, int target_idx, double target_yaw, double target_speed, int peak_value);
    void butterworth_filter_generate(double filter_radius, int filter_order, double map_resolution, int peak_value);
    void scan_cb(const sensor_msgs::PointCloud2 cloud_msg);

    // ROS related
    ros::NodeHandle nh_, pnh_;
    ros::Subscriber sub_scan_;
    ros::Publisher pub_map_;
    ros::Publisher pub_footprint_;
    string localmap_frameid_;                               // Localmap frame_id
    nav_msgs::OccupancyGrid::Ptr localmap_ptr_;             // Localmap msg
    geometry_msgs::PolygonStamped::Ptr footprint_ptr_;      // Robot footprint

    // TF listener
    tf::TransformListener* tflistener_ptr_;
    tf::StampedTransform tf_base2camera_;    

    // Inflation filter kernel
    vector<vector<int8_t> > inflation_kernel_;

    // PCL Cropbox filter
    // pcl::CropBox<pcl::PointXYZ> box_filter_; 
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

    // ROS publishers & subscribers
    sub_scan_ = nh_.subscribe("/scan_pointcloud_filtered", 1, &Scan2LocalmapNode::scan_cb, this);
    pub_map_ = nh_.advertise<nav_msgs::OccupancyGrid>("local_map", 1);
    pub_footprint_ = nh_.advertise<geometry_msgs::PolygonStamped>("footprint", 1);


    // Prepare the transformation matrix from laser to base
    tflistener_ptr_ = new tf::TransformListener();
    ROS_INFO("Wait for TF from camera to %s in 10 seconds...", localmap_frameid_.c_str());
    try{
        tflistener_ptr_->waitForTransform(localmap_frameid_, "camera_link",
                                    ros::Time(), ros::Duration(10.0));
        tflistener_ptr_->lookupTransform(localmap_frameid_, "camera_link",
                                    ros::Time(), tf_base2camera_);
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

    // // Cropbox filter init:filter out pointscloud  in a cubic
    // box_filter_.setMax(Eigen::Vector4f(0.5 + inflation_radius, 0.35 + inflation_radius, 8.0, 1.0));
    // box_filter_.setMin(Eigen::Vector4f(-0.5 - inflation_radius, -0.35 - inflation_radius, 0, 1.0));
    // box_filter_.setKeepOrganized(false);
    // box_filter_.setNegative(false);

    // Filter kernel generator
    butterworth_filter_generate(inflation_radius, 6, map_resolution, 100);
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

//convert laserscan to localmap 
void Scan2LocalmapNode::scan_cb(const sensor_msgs::PointCloud2 cloud_msg) {
    // std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

    // Convert  ROS PointCloud2 --> PCL PointCloudXYZ
    PointCloudXYZPtr cloud_raw(new PointCloudXYZ);
    PointCloudXYZPtr cloud_transformed(new PointCloudXYZ);
    pcl::fromROSMsg(cloud_msg, *cloud_raw);
    pcl_ros::transformPointCloud(*cloud_raw, *cloud_transformed, tf_base2camera_);
    //apply filter
    PointCloudXYZPtr cloud_filtered(new PointCloudXYZ);
    pcl::PassThrough<pcl::PointXYZ> pass;
    pass.setInputCloud(cloud_transformed);
    pass.setFilterFieldName("y");
    pass.setFilterLimits(-0.5,-0.1);
    pass.setFilterLimitsNegative(false);
    pass.filter (*cloud_filtered);
    for(int i = 0; i < cloud_filtered->points.size(); i++) {
       
        cloud_filtered->points[i].y=0;
        
    }
    // // Apply cropbox filter
    // box_filter_.setInputCloud(cloud_filtered);
    // box_filter_.filter(*cloud_filtered);

    // Localmap init
    std::fill(localmap_ptr_->data.begin(), localmap_ptr_->data.end(), 0);

    double resolution = localmap_ptr_->info.resolution;
    double map_origin_x = localmap_ptr_->info.origin.position.x;
    double map_origin_y = localmap_ptr_->info.origin.position.y;
    int map_width = localmap_ptr_->info.width;
    int map_height = localmap_ptr_->info.height;
    int map_limit = map_width * map_height;

    for(int i = 0; i < cloud_filtered->points.size(); i++) {
        double laser_x = cloud_filtered->points[i].z;
        double laser_y = -cloud_filtered->points[i].x+ 0.3;
        //check if point is out of range
        if(fabs(laser_x) > map_height * resolution / 2)
            continue;
        else if(fabs(laser_y) > map_width * resolution / 2)
            continue;

        // Add wall(non-walkable) space
        int map_x = std::round((laser_x - map_origin_x) / resolution);
        int map_y = std::round((laser_y - map_origin_y) / resolution);
        int idx = map_y * map_width + map_x;
        
        if((0 < idx) && (idx < map_limit)){
            if(localmap_ptr_->data[idx] == 100)
                continue;
            butterworth_filter(localmap_ptr_->data, map_width, map_height, idx, 100);
        }
    }

    // Publish localmap
    ros::Time now = ros::Time(0);
    localmap_ptr_->header.stamp = now;
    pub_map_.publish(*localmap_ptr_);

    // Publish footprint
    footprint_ptr_->header.stamp = now;
    pub_footprint_.publish(*footprint_ptr_);

    // std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
    // std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() << "[µs]" << std::endl;
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
