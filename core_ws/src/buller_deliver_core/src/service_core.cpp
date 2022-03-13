#include <string.h>
#include <sstream>
//#include <iostream>
// #include <sstream>

#include <ros/ros.h>
#include <std_msgs/Bool.h>
#include "std_msgs/String.h"
#include "tf2_msgs/TFMessage.h"

int roomnum;
int servicenum;
int a,b,c,food_ch,towel_ch,go,re=0;

class ServiceCore
{
public:
  
  ServiceCore()
  {
    //pub status
    pubServiceStatusbuller = nh_.advertise<std_msgs::String>("/log",1);
    //Sub room
    sub_room_101 = nh_.subscribe("a", 100, &ServiceCore::room101, this);
    sub_room_102 = nh_.subscribe("b", 100, &ServiceCore::room102, this);
    sub_room_102 = nh_.subscribe("c", 100, &ServiceCore::room103, this);
    
    //Sub service
    sub_service_food = nh_.subscribe("food", 100, &ServiceCore::food, this);
    sub_service_towel = nh_.subscribe("towel", 100, &ServiceCore::towel, this);

    //Service_status
    sub_service_start = nh_.subscribe("goroom", 100, &ServiceCore::food, this);
    sub_service_return = nh_.subscribe("return", 100, &ServiceCore::food, this);

    ros::Rate loop_rate(5);

    while (ros::ok())
    {
      //ServiceStatus();

      

      ros::spinOnce();
      loop_rate.sleep();
    }
    // is_pose_initialized = fnSetInitialPose();
  }
///////////////////////////////////
  void room101(const std_msgs::Bool::ConstPtr& message)
  {    
    if(a==0){
      roomnum=101;
      ROS_INFO("room101 %d",roomnum);
      PubServiceStatus();
    }
    else
      a=0;
  }
  void room102(const std_msgs::Bool::ConstPtr& message)
  { 
    if(b==0){
      roomnum=102;
      ROS_INFO("room102 %d",roomnum);
      b=1;
    }
    else
      b=0;
  }
  void room103(const std_msgs::Bool::ConstPtr& message)
  {    
    if(c==0){
      roomnum=103;
      ROS_INFO("room103 %d",roomnum);
      c=1;
    }
    else
      c=0;    
  }
  void food(const std_msgs::Bool::ConstPtr& message)
  {
    if(food_ch==0){
      servicenum=1;
      ROS_INFO("food %d",servicenum);
      ServiceSequence();
      food_ch=1;
    }
    else
      food_ch=0;
  }    
  void towel(const std_msgs::Bool::ConstPtr& message)
  {
    if(towel_ch==0){
      servicenum=2;
      ROS_INFO("towel %d",servicenum);
      ServiceSequence();
      towel_ch=1;
    }
    else
      towel_ch=0;
  }
  void service_start(const std_msgs::Bool::ConstPtr& message)
  {
    if(go==0){
      //robot_service_sequence[ROBOT_NUMBER_BULLER1]=4;
      go=1;
    }
    else
      go=0;
  }
  void RETURN(const std_msgs::Bool::ConstPtr& message)
  {
    if(re==0){
      //robot_service_sequence[ROBOT_NUMBER_BULLER1]=5;
      re=1;
    }
    else
      re=0;
  }
//////////////////
  void ServiceStatus()
  {/*
    if(robot_service_sequence[ROBOT_NUMBER_BULLER1]!=0&&robot_service_sequence[ROBOT_NUMBER_BULLER2]!=0)
      ROS_INFO("wait");*/

    ROS_INFO("needcheck : %d,%d",roomnum,servicenum);
  }
////////////////
  void ServiceSequence()
  {/*
    if(robot_service_sequence[ROBOT_NUMBER_BULLER1]!=0){
      if(robot_service_sequence[ROBOT_NUMBER_BULLER2]!=0)
        ServiceStatus();

      robot_service_sequence[ROBOT_NUMBER_BULLER2]=1;      
    }
    else
      robot_service_sequence[ROBOT_NUMBER_BULLER1]=0;*/
  }
///////////////
  void PubServiceStatus()
  {
    a=1;
    std::string str;
    std_msgs::String message;
    std::stringstream oss;
   
    oss << "robot";
    str = oss.str();
    message.data = str;
    pubServiceStatusbuller.publish(message);
    ROS_INFO("status : %s",message.data.c_str());
    
  }

private:
  ros::NodeHandle nh_;

  // Publisher
  ros::Publisher pubServiceStatusbuller;
  // Subscriber
  ros::Subscriber sub_room_101;
  ros::Subscriber sub_room_102;
  ros::Subscriber sub_room_103;
  ros::Subscriber sub_service_food;
  ros::Subscriber sub_service_towel;
  ros::Subscriber sub_service_start;
  ros::Subscriber sub_service_return;
};

int main(int argc, char **argv)
{
  //Initiate ROS
  ros::init(argc, argv, "service_core");
  

  //Create an object of class ServiceCore that will take care of everything
  ServiceCore serviceCore;

  ros::spin();

  return 0;
}
