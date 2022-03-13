#!/usr/bin/env python3

import rospy
from hotword_detection.msg import Num
from std_msgs.msg import String

def talker():
    pub = rospy.Publisher('to_cpp_from_python',String,queue_size=10)
    rospy.init_node('infodata_publisher_node')
    rate = rospy.Rate(10)
    #number = Num()
    #number.num = 32

    while not rospy.is_shutdown():
        send_str="%s" % rospy.get_time()
        rospy.loginfo(send_str)
        pub.publish(send_str)

        rate.sleep()

if __name__=='__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
