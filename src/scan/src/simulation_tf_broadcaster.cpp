#include <chrono>
#include <signal.h>
#include <math.h>
#include <algorithm>

#include <tf/transform_broadcaster.h>



#include "ros/ros.h"
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/Path.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PolygonStamped.h>
#include <std_msgs/Float32.h>




void poseCallback(const nav_msgs::Path &msg){
    static tf::TransformBroadcaster br;
    tf::Transform transform;
    transform.setOrigin( tf::Vector3(msg.poses[msg.poses.size()-2].pose.position.x, msg.poses[msg.poses.size()-2].pose.position.y, 0.0) );
    
    tf::Quaternion q;
    q.setRPY(0, 0, msg.poses[msg.poses.size()-2].pose.orientation.z);
    printf("%f\n",msg.poses[msg.poses.size()-2].pose.orientation.z);
    transform.setRotation(q);
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "odom_filtered", "base_link"));
}

int main(int argc, char** argv){
    ros::init(argc, argv, "my_tf_broadcaster");


    ros::NodeHandle node;
    ros::Subscriber sub = node.subscribe("walkable_path", 100, &poseCallback);

    ros::spin();
    return 0;
};