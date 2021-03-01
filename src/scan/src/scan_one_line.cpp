#include <iostream>

// ROS
#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <sensor_msgs/PointCloud2.h>
#include <laser_geometry/laser_geometry.h>

//TF
#include <tf/transform_listener.h>

// PCL
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/transforms.h>
#include <pcl/filters/passthrough.h>
#include <pcl/filters/crop_box.h>
#include <pcl/filters/voxel_grid.h>



using namespace std;

typedef pcl::PointCloud<pcl::PointXYZ> PointCloudXYZ;
typedef pcl::PointCloud<pcl::PointXYZ>::Ptr PointCloudXYZPtr;
typedef pcl::PointCloud<pcl::PointXYZRGB> PointCloudXYZRGB;
typedef pcl::PointCloud<pcl::PointXYZRGB>::Ptr PointCloudXYZRGBPtr;


ros::Publisher pub_combined_image;



void scan_callback(const sensor_msgs::PointCloud2 cloud_msg){
    // cout << "hi" << endl;

    // // Laserscan -> ROS PointCloud2
    // sensor_msgs::PointCloud2 cloud_msg;
    // projector.projectLaser(laser_msg, cloud_msg);
    // //pub_combined_image.publish(cloud_msg);
     tf::TransformListener* tflistener_ptr_;
    tflistener_ptr_ = new tf::TransformListener();
    tf::StampedTransform stamped_transform;
    try{
        tflistener_ptr_->waitForTransform("camera_link", "camera_color_optical_frame", 
                                    ros::Time(0), ros::Duration(10.0));
        tflistener_ptr_->lookupTransform("camera_link",  "camera_color_optical_frame", 
                                    ros::Time(0), stamped_transform);
    }
    catch (tf::TransformException ex){
        ROS_ERROR("Cannot get TF from camera to laserscan: %s. Aborting...", ex.what());
        exit(-1);
    }


    // ROS PointCloud2 -> PCL Pointcloud
    PointCloudXYZPtr cloud_raw(new PointCloudXYZ);
    PointCloudXYZPtr cloud_transformed(new PointCloudXYZ);
    pcl::fromROSMsg(cloud_msg, *cloud_raw);
    pcl_ros::transformPointCloud(*cloud_raw, *cloud_transformed, stamped_transform);
    // for(int i = 0; i < cloud_filtered->points.size(); i++) {
       
    //     cloud_filtered->points[i].y=0;
        
    // }
    pcl::CropBox<pcl::PointXYZ> box_filter_; 
    box_filter_.setMax(Eigen::Vector4f(10, 3.0, 2, 1.0));
    box_filter_.setMin(Eigen::Vector4f(0, -3, -0.6, 1.0));
    box_filter_.setKeepOrganized(false);
    box_filter_.setNegative(false);
    box_filter_.setInputCloud(cloud_transformed);
    box_filter_.filter(*cloud_transformed);
    //cout << cloud_raw->points.size()<< endl;

    pcl::VoxelGrid<pcl::PointXYZ> sor;
    PointCloudXYZPtr cloud_filtered(new PointCloudXYZ);
    sor.setInputCloud (cloud_transformed);
    sor.setLeafSize (0.06f, 0.06f, 0.06f);
    sor.filter (*cloud_filtered);
    //cout << cloud_filtered->points.size()<< endl;
    
    // PointCloudXYZPtr cloud_filtered2(new PointCloudXYZ);
    // pcl::RadiusOutlierRemoval<pcl::PointXYZ> rorfilter;
    // rorfilter.setInputCloud(cloud_filtered);
    // rorfilter.setRadiusSearch(0.5);
    // rorfilter.setMinNeighborsInRadius (3);
    // rorfilter.filter (*cloud_filtered2);
    sensor_msgs::PointCloud2 output;
    pcl::toROSMsg(*cloud_transformed, output);
    pub_combined_image.publish(output);
    

    // PCL Pointcloud -> ROS PointCloud2
    // sensor_msgs::PointCloud2 output;
    // pcl::toROSMsg(*cloud_raw, output);
    // pub_combined_image.publish(output);
}


int main(int argc, char **argv) {
    ros::init(argc, argv, "scan_node");
    ros::NodeHandle nh;
    
    // ROS related
    pub_combined_image = nh.advertise<sensor_msgs::PointCloud2>("scan_pointcloud2", 1);
   
    ros::Subscriber scan_sub = nh.subscribe("/camera/depth_registered/points", 1, scan_callback);


    ros::spin();
    return 0;
}
