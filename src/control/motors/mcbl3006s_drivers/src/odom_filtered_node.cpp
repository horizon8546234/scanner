#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <iomanip>
#include <mutex>
#include "serial/serial.h"

// For ROS
#include <ros/ros.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Quaternion.h>
#include <geometry_msgs/TransformStamped.h>
#include <nav_msgs/Odometry.h>
#include <std_srvs/Trigger.h>
#include <std_srvs/SetBool.h>

using namespace std;

void callback(const nav_msgs::Odometry odom_msg)
{
    tf::TransformBroadcaster  odom_broadcaster_;
    ros::Time last_feedback_time_; 
    ros::Time current_time = ros::Time::now();
    double time_diff = (current_time - last_feedback_time_).toSec();
    volatile double robot_theta_ ;
    robot_theta_ += odom_msg.twist.twist.angular.z* time_diff;
    geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(robot_theta_);
    geometry_msgs::TransformStamped odom_tf_msg;
    odom_tf_msg.header.stamp = current_time;
    odom_tf_msg.header.frame_id = "odom_filtered";
    odom_tf_msg.child_frame_id = "base_link";
    odom_tf_msg.transform.translation.x = odom_msg.pose.pose.position.x;
    odom_tf_msg.transform.translation.y = odom_msg.pose.pose.position.y;
    odom_tf_msg.transform.rotation = odom_quat;
    odom_broadcaster_.sendTransform(odom_tf_msg);
    last_feedback_time_ = ros::Time::now();
} 

int main(int argc, char **argv) {
    ros::init(argc, argv, "odom_filetered_node");
    ros::NodeHandle nh;
    // ROS related
    
    ros::Subscriber scan_sub = nh.subscribe("/odometry/filtered", 1, callback);

    ros::spin();
    return 0;
}