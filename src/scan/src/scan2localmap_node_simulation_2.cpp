#include <chrono>
#include <cmath>
#include <math.h>
#include <signal.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <Eigen/Geometry>
#include <Eigen/Dense>

#include "ros/ros.h"
#include <geometry_msgs/PolygonStamped.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Point32.h>
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Odometry.h>
#include <laser_geometry/laser_geometry.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
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
using namespace Eigen;

double true_time =0;

int localmap_range=10;
double walker_position_x=0;
double walker_position_y=0;
double map_resolution=0.1;
vector<vector<int8_t> > inflation_kernel_;
double people1_x = 3;
double people1_y = 4;
double people1_vx = -0.707;
double people1_vy = -0.707;
double people1_comfort=0;
double d1=0;
double people1w_comfort=0;

double people2_x = 3.5;
double people2_y = -0.6;
double people2_vx = -1;
double people2_vy = 0;
double people2_comfort=0;
double d2=0;
double people2w_comfort=0;

double walker_x = -4;
double walker_y = 0;
double walker_vx = 0;
double walker_vy = 0;
double walker_theta=0;
double time5=0;
int tset = 10;

ofstream ofs;
visualization_msgs::MarkerArray mrk_array;
visualization_msgs::Marker pedestrian;
visualization_msgs::Marker arrow;

tf2::Quaternion q;

void fake_map(nav_msgs::OccupancyGrid &localmap_ptr_);
void map_initialize(nav_msgs::OccupancyGrid &localmap_ptr_);
void footprint_initialize(geometry_msgs::PolygonStamped &footprint);
void butterworth_filter_generate(double filter_radius, int filter_order, double map_resolution, int peak_value);
void butterworth_filter(vector<int8_t> &vec, int map_width, int map_height, int target_idx, int peak_value);
void asymmetric_gaussian_filter(vector<int8_t> &vec, double map_resolution, int map_width, int map_height,int map_x, int target_idx, double target_yaw, double target_speed, int peak_value);

bool flag_first_time = true;
void callback(const geometry_msgs::PointStamped::ConstPtr& msg)
{
    if(flag_first_time){
        flag_first_time = false;
        time5 = ros::Time::now().toSec();
        return;
    }

    double time_walker = ros::Time::now().toSec()-time5;
    true_time+=time_walker;
    //cout << ros::Time::now().toSec()-time5 <<endl;
    //cout <<true_time <<endl;
    
    walker_vx=msg->point.x-walker_x;
    walker_vy=msg->point.y-walker_y;
    walker_x=msg->point.x;
    walker_y=msg->point.y;
    walker_theta=atan2(walker_vy,walker_vx)*180/3.14+90;
    //cout<<"walker_speed"<<sqrt(pow((walker_vx),2) + pow((walker_vy),2))<<endl;
    ofs << true_time/2<<" ";
    
    ofs << people1_comfort<<" ";
    ofs << d1 <<" ";
    
    ofs << people2_comfort<<" ";
    ofs << d2 <<" ";
    ofs << walker_x << " ";
    ofs << walker_y << "\n";
    time5=ros::Time::now().toSec();
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "camera_mapping_node");
    ros::NodeHandle nh, pnh("~");
    ros::Publisher pub_map_=nh.advertise<nav_msgs::OccupancyGrid>("local_map", 1); 
    ros::Publisher pub_footprint_=nh.advertise<geometry_msgs::PolygonStamped>("footprint", 1000); 
    ros::Publisher pub_marker_array_=nh.advertise<visualization_msgs::MarkerArray>("pedestrians",1000);
    nav_msgs::OccupancyGrid localmap_ptr_;
    geometry_msgs::PolygonStamped footprint;
    map_initialize(localmap_ptr_);
    footprint_initialize(footprint);
    butterworth_filter_generate(0.3, 6, map_resolution, 100);
    ros::Subscriber sub = nh.subscribe("walker_position", 1, callback);
/*
    ros::AsyncSpinner spinner(1);
    spinner.start();
*/
    ofs.open("/home/hou/scanner/output_2.txt");
    while (ros::ok())
    {
        ros::spinOnce();
        fake_map(localmap_ptr_);
        ros::Time now = ros::Time(0);
        localmap_ptr_.header.stamp = now;
        pub_map_.publish(localmap_ptr_);
        pub_footprint_.publish(footprint);
        pub_marker_array_.publish(mrk_array);
        

    }
    
    return 0;
}

void fake_map(nav_msgs::OccupancyGrid &localmap_ptr_)
{
    

    mrk_array=visualization_msgs::MarkerArray();
    fill(localmap_ptr_.data.begin(), localmap_ptr_.data.end(), 0);
    double resolution = localmap_ptr_.info.resolution;
    double map_origin_x = localmap_ptr_.info.origin.position.x;
    double map_origin_y = localmap_ptr_.info.origin.position.y;
    int map_width = localmap_ptr_.info.width;
    int map_height = localmap_ptr_.info.height;
    int map_limit = map_width * map_height;
    int count=0;


    

    //people1   
    double time1=ros::Time::now().toSec();
    for(int j = 0; j < tset; j++)
    {
        
        double px1_now = people1_x + 0.2 * j * -0.707;
        double py1_now = people1_y + 0.2 * j * -0.707;
        int map_x = round((px1_now- map_origin_x) / resolution);
        int map_y = round((py1_now- map_origin_y) / resolution);
        
        
        int idx = map_y * map_width + map_x;
        
        
        
            
        
        if(j==0)
        {
            

            if(px1_now>-4.9)
            {
                for(int m=-1;m<=1;m++)
                {
                    for(int n=-1;n<=1;n++)
                    {
                        int map1_x = map_x+m;
                        int map1_y = map_y+n;
                        int idx1 = map1_y * map_width + map1_x;
                        butterworth_filter(localmap_ptr_.data, map_width, map_height, idx1, 100);
                    }
                }
                localmap_ptr_.data[idx] = 100;
                butterworth_filter(localmap_ptr_.data, map_width, map_height, idx, 100);
                asymmetric_gaussian_filter(localmap_ptr_.data, resolution, map_width, map_height,map_x, idx, atan2(people1_vy,people1_vx) , 1, 100);
            }
            //cout << map_x <<endl;
            d1=sqrt(pow((px1_now-walker_x),2) + pow((py1_now-walker_y),2));
            d1-=0.6;
        }

        double theta_1=atan2((people1_y-walker_y),(people1_x-walker_x))+1.57;
        //cout << "theta" << theta_1*180/3.14<<endl;
        
        


        double decrease1 = cos(walker_theta-theta_1);
        //cout << "theta" << walker_theta-theta_1<<endl;
        //cout << "theta" << decrease1<<endl;



        

        double theta_relative_velocity1= atan2(walker_vy-people1_vy,walker_vx-people1_vx)+1.57;
        
        double decrease11 = cos(theta_relative_velocity1-theta_1);
        //cout << "relative_theta" << (theta_relative_velocity1)*180/3.14 <<endl; 
        if(decrease11<0)
            decrease11=0.01;
        else if(decrease11<0.5)
            decrease11=0.5;

        people1_comfort=2/(1+exp(0.8*d1/decrease11));
        
        if(people1_x>walker_x)
            asymmetric_gaussian_filter(localmap_ptr_.data, resolution, map_width, map_height,map_x, idx, atan2(people1_vy,people1_vx) , 1, 200/(1+exp(0.03*j*d1/decrease11)));
        else
            asymmetric_gaussian_filter(localmap_ptr_.data, resolution, map_width, map_height,map_x, idx, atan2(people1_vy,people1_vx) , 1, 0);
    }
    
    //cout<<"people1_comfort"<<people1_comfort  <<endl;
    
    
    
    

    //cout<<"people1_comfort"<<people1_comfort<<endl;
    //people2   
    
    for(int j = 0; j < tset; j++)
    {
        double px2_now = people2_x + 0.2 * j *-1;
        double py2_now = people2_y + 0.2 * j * people2_vy;
        int map_x = round((px2_now- map_origin_x) / resolution);
        int map_y = round((py2_now- map_origin_y) / resolution);
    
        
        int idx = map_y * map_width + map_x;
        
        
        
            
        
        if(j==0)
        {

            
            //cout << map_x <<endl;
            d2=sqrt(pow((px2_now-walker_x),2) + pow((py2_now-walker_y),2));
            d2-=0.6;
            if(px2_now>-4.9)
            {
                for(int m=-1;m<=1;m++)
                {
                    for(int n=-1;n<=1;n++)
                    {
                        int map1_x = map_x+m;
                        int map1_y = map_y+n;
                        int idx1 = map1_y * map_width + map1_x;
                        butterworth_filter(localmap_ptr_.data, map_width, map_height, idx1, 100);
                    }
                }
                localmap_ptr_.data[idx] = 100;
                butterworth_filter(localmap_ptr_.data, map_width, map_height, idx, 100);
                asymmetric_gaussian_filter(localmap_ptr_.data, resolution, map_width, map_height,map_x, idx, atan2(people2_vy,people2_vx) , 1, 100);
            }
                
            
        }
        double theta = acos((people2_x-walker_x)/d2);
        double decrease = cos(theta);

        double theta_2=atan2((people2_y-walker_y),(people2_x-walker_x));
        
        //cout << "theta" << theta_2*180/3.14<<endl;

        double theta_relative_velocity2= atan2(walker_vy-people2_vy,walker_vx-people2_vx);
        double decrease22 = cos(theta_relative_velocity2-theta_2);

        

        


        if(decrease22<0)
            decrease22=0.01;
        else if(decrease22<0.5)
            decrease22=0.5;

        
        
        people2_comfort=2/(1+exp(0.8*d2/decrease22));
        //cout << "relative_theta" << (theta_relative_velocity2)*180/3.14+90 <<endl; 



        if(people2_x>walker_x)
            asymmetric_gaussian_filter(localmap_ptr_.data, resolution, map_width, map_height,map_x, idx, atan2(people2_vy,people2_vx) , 1, 200/(1+exp(0.03*j*d2/decrease22)));
        else
            asymmetric_gaussian_filter(localmap_ptr_.data, resolution, map_width, map_height,map_x, idx, atan2(people2_vy,people2_vx) , 1, 0);
        
        
    }
    
    

    cout<<"people2_comfort"<<people2_comfort<<endl;
    
    double time3=ros::Time::now().toSec();
    if(people1_x>-5)
    {
        people1_vx=-0.707*(time3-time1);
        people1_x+=people1_vx*0.667*0.7;
        people1_vy=-0.707*(time3-time1);
        people1_y+=people1_vy*0.667*0.7;
        double yaw_1=atan2(people1_vy,people1_vx);
        q.setRPY(0,0,yaw_1);
        q=q.normalize();
        pedestrian.header.frame_id = "base_link";
        pedestrian.ns = "pedestrian";
        pedestrian.type = visualization_msgs::Marker::CYLINDER;
        pedestrian.action = visualization_msgs::Marker::ADD;
        pedestrian.pose.orientation.w = 1.0;
        pedestrian.scale.x = 0.6;
        pedestrian.scale.y = 0.6;
        pedestrian.scale.z = 0.6;
        pedestrian.color.a = 1.0;
        pedestrian.color.b = 1.0;
        pedestrian.lifetime = ros::Duration(0.5);
        pedestrian.id = 0;
        pedestrian.pose.position.x = people1_x;
        pedestrian.pose.position.y = people1_y;
        pedestrian.pose.position.z = 0.3;
        pedestrian.pose.orientation.x=q[0];
        pedestrian.pose.orientation.y=q[1];
        pedestrian.pose.orientation.z=q[2];
        pedestrian.pose.orientation.w=q[3];
        pedestrian.header.stamp = ros::Time();
        mrk_array.markers.push_back(pedestrian);
        arrow = pedestrian;
        arrow.type = visualization_msgs::Marker::ARROW;
        arrow.ns = "direction" ;
        arrow.scale.x = 0.8;
        arrow.scale.y = 0.2;
        arrow.scale.z = 0.2;
        mrk_array.markers.push_back(arrow);
            
    }
    if(people2_x>-5)
    {
        people2_vx=-1*(time3-time1);
        people2_x+=people2_vx*0.667*0.7;
        double yaw_2=atan2(people2_vy,people2_vx);
        q.setRPY(0,0,yaw_2);
        q=q.normalize();
        pedestrian.header.frame_id = "base_link";
        pedestrian.ns = "pedestrian";
        pedestrian.type = visualization_msgs::Marker::CYLINDER;
        pedestrian.action = visualization_msgs::Marker::ADD;
        pedestrian.pose.orientation.w = 1.0;
        pedestrian.scale.x = 0.6;
        pedestrian.scale.y = 0.6;
        pedestrian.scale.z = 0.6;
        pedestrian.color.a = 1.0;
        pedestrian.color.b = 1.0;
        pedestrian.lifetime = ros::Duration(0.5);
        pedestrian.id = 1;
        pedestrian.pose.position.x = people2_x;
        pedestrian.pose.position.y = people2_y;
        pedestrian.pose.position.z = 0.3;
        pedestrian.pose.orientation.x=q[0];
        pedestrian.pose.orientation.y=q[1];
        pedestrian.pose.orientation.z=q[2];
        pedestrian.pose.orientation.w=q[3];
        pedestrian.header.stamp = ros::Time();
        mrk_array.markers.push_back(pedestrian);
        arrow = pedestrian;
        arrow.type = visualization_msgs::Marker::ARROW;
        arrow.ns = "direction" ;
        arrow.scale.x = 0.8;
        arrow.scale.y = 0.2;
        arrow.scale.z = 0.2;
        mrk_array.markers.push_back(arrow);
    }

    //true_time+=time3-time2;
    //cout <<"time2:"<<time3-time2<<endl;
}
void map_initialize(nav_msgs::OccupancyGrid &localmap_ptr_)
{
    localmap_ptr_.info.width = localmap_range  / map_resolution;
    localmap_ptr_.info.height = localmap_range  / map_resolution;
    
    localmap_ptr_.info.resolution = map_resolution;
    localmap_ptr_.info.origin.position.x = -localmap_ptr_.info.resolution * localmap_ptr_.info.width / 2;
    localmap_ptr_.info.origin.position.y = -localmap_ptr_.info.resolution * localmap_ptr_.info.height / 2;
    localmap_ptr_.info.origin.orientation.w = 1.0;
    localmap_ptr_.data.resize(localmap_ptr_.info.width * localmap_ptr_.info.height);
    localmap_ptr_.header.frame_id = "base_link";
    
}
void footprint_initialize(geometry_msgs::PolygonStamped &footprint)
{
    footprint.header.frame_id = "base_link";
    geometry_msgs::Point32 pt;
    pt.x = -0.1+walker_position_x, pt.y = 0.3314+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.3+walker_position_x, pt.y = 0.3314+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.4414+walker_position_x, pt.y = 0.19+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.4414+walker_position_x, pt.y = -0.19+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.3+walker_position_x, pt.y = -0.3314+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = -0.1+walker_position_x, pt.y = -0.3314+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = -0.1+walker_position_x, pt.y = -0.2014+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.25+walker_position_x, pt.y = -0.2014+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.3561+walker_position_x, pt.y = -0.0953+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.3561+walker_position_x, pt.y = 0.0953+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = 0.25+walker_position_x, pt.y = 0.2014+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
    pt.x = -0.1+walker_position_x, pt.y = 0.2014+walker_position_y, pt.z = 0.0;
    footprint.polygon.points.push_back(pt);
}


void butterworth_filter_generate(double filter_radius, int filter_order, double map_resolution, int peak_value) {
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

void butterworth_filter(vector<int8_t> &vec, int map_width, int map_height, int target_idx, int peak_value) {
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

void asymmetric_gaussian_filter(vector<int8_t> &vec, double map_resolution, int map_width, int map_height,int map_x, int target_idx, double target_yaw, double target_speed, int peak_value) {


    if(peak_value>100)
        peak_value=100;
        
    // Gaussian Filter kernel
    vector<vector<int8_t> > agf_kernel;
    // double kernel_range = 2.4 * 2;
    double kernel_range = 7.5 * 2;
    double max_kernel_range = kernel_range / 2 * 1.0000001;
    for(double y = -kernel_range / 2 ; y <= max_kernel_range; y += map_resolution){
        vector<int8_t> tmp_row;
        for(double x = -kernel_range / 2; x <= max_kernel_range; x += map_resolution){
            double sigma_head = 1.5;
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

            if(vec[op_idx] < 0) continue;                                 // do not apply filter out of laser range
            else if(op_kernel_val == 0 || vec[op_idx] >= op_kernel_val) continue;
            //else if(abs((target_idx % map_width + x)) < map_width/2 ) continue; 
            else if((map_x + x) < 0) continue;
            else if(op_idx < 0 || op_idx > max_map_idx) continue;          // upper and bottom bound
            else if(abs((op_idx % map_width) - (target_idx % map_width)) > bound) continue;  // left and right bound
            else{
                //int tmp_val = op_kernel_val + vec[op_idx];
                vec[op_idx] = (op_kernel_val >= 100)? 100 : op_kernel_val;
            }
        }
    }


}