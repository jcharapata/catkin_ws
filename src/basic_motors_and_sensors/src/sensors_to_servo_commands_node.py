#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 30 13:59:55 2021

@author: pi
"""

import rospy
# "traceback" is a library that lets you track down errors. 
import traceback
# Import the message types we will need
from std_msgs.msg import Int32, Float32

# Set up callable Publishers and messages
pub_servo_command_0 = rospy.Publisher('/servo_command_0',Int32,queue_size=1)

def sensors_to_servo():
    rospy.init_node('sensors_to_servo_commands_node',anonymous=False)
    
    sub_A0_proc = rospy.Subscriber('/sensors_A0_proc',Float32,A0_proc_to_servo_command)
    
    # prevent the node from exiting
    rospy.spin()
    
    
def A0_proc_to_servo_command(msg_in):
    
    # unpack the message
    A0_proc = msg_in.data
    servo_command_0_msg = Int32()

    
    while not rospy.is_shutdown(): 
    
        # use the Python "input" command to get a value. Use the int() function to turn the string into an integer. 
        if A0_proc < 1:
            servo_command_0 = 500         
        else:
            servo_command_0 = 2500
            
        # Pack the message object with the current data.
        servo_command_0_msg.data = servo_command_0
        
        # Publish the message. 
        pub_servo_command_0.publish(servo_command_0_msg)

    
    # Section to start the execution, with Exception handling.         
if __name__ == "__main__": 
    try: 
        sensors_to_servo()
    except : 
        traceback.print_exc()   # Print any error to the screen. 
        pass