#include <ros/ros.h>
//#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/Int32.h>
#include "hotword_detection/Control.h"

//void chatterCallback(const std_msgs::Int32::ConstPtr& msg){
void chatterCallback(const hotword_detection::Control &msg){
	//double position.x =msg->data[0];
  //ROS_INFO("I heard: x = %.2f, y = %.2f, z = %.2f ", msg->data[0], msg->data[1], msg->data[2]);
  ROS_INFO("I heard: x = %.2d", msg.detect_word);
}


int main(int argc, char **argv){

  ros::init(argc, argv, "infodata_subscriber_node");

  ros::NodeHandle nh;

  ros::Subscriber sub = nh.subscribe("to_cpp_from_python", 1000, chatterCallback);

  ros::spin();

  return 0;
}
