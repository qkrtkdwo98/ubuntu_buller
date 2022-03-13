#include <string.h>
#include <sstream>
// #include <iostream>
// #include <sstream>

#include <ros/ros.h>
#include <std_msgs/Bool.h>
#include "std_msgs/String.h"

void statusCallback(const std_msgs::String& serviceStatus)
{
  ROS_INFO("check : %s", serviceStatus.data.c_str());
}

int main(int argc, char **argv)
{
  //Initiate ROS
  ros::init(argc, argv, "service_check");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("buller1_status",10,statusCallback);  

  //Create an object of class ServiceCore that will take care of everything
  
  ros::spin();

  return 0;
}
