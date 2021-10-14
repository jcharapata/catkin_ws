#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 23 13:14:54 2021

@author: pi
"""

import rospy
import time
import sys
import traceback
import encoders
import numpy as np
from matplotlib import pyplot as plt
from std_msgs.msg import Float32

# Initialize the Node. This can happen here (to be executed as the script is interpreted by Python) or inside a function, but it must take place before any ROS communications take place. 
rospy.init_node('motor_command_node',anonymous=False)

#def listener():
#    
#    sub1 = rospy.Subscriber('/encoderLeft', Int32, calc_speed_left)
#    sub2 = rospy.Subscriber('/encoderRight', Int32, calc_speed_right)
#
#def calc_speed_left(msg_in):
#    p_1 = msg_in.data
#    time.sleep(3)
#    p_2 = msg_in
#    delta = p_2-p_1 
#    V_left = delta / 3
#    print(V_left)
#    
#def calc_speed_right(msg_in):
#    p_1 = msg_in.data
#    time.sleep(3)
#    p_2 = msg_in
#    delta = p_2-p_1 
#    V_right = delta / 3
#    print(V_right)

#define empty lists for graphs
xdata = []
ydata = []


def talker_for_wheel_commands():

    # Set up a Publisher
    ## 1st argument: topic; 2nd arg: message type; 3rd arg: queue_size - use 1 if you only want the latest to be read. See https://wiki.ros.org/rospy/Overview/Publishers%20and%20Subscribers)
    pub_wheel_command_left = rospy.Publisher('wheel_command_left',Float32,queue_size=1)
    
    # Create the message object (empty at first) that will be populated and then published. Use the message type that was declared in the Publisher. 
    wheel_command_left_msg = Float32()
    
    #### CODE HERE ####
    # Add a Publisher for the Right wheel
    pub_wheel_command_right = rospy.Publisher('wheel_command_right',Float32,queue_size=1)
    
    wheel_command_right_msg = Float32()
    #### END CODE ####
    
    
    # Code for the specific functions of this Node: 
    # Here a while loop that gets user input of desired wheel command and publishes it. 
    # The condition on the "while" (rospy.is_shutdown()) evaluates whether ROS is in the process of shutting down, or has shut down. See https://wiki.ros.org/rospy/Overview/Initialization%20and%20Shutdown 
    #while not rospy.is_shutdown(): 
    for ii in range (3) : 
        
        # define specified amount of time for motors to run
        run_time = 5 
    
        # use the Python "input" command to get a value. Use the int() function to turn the string into an integer. 
        wheel_command_left = int(input('Enter wheel command left (-480 to +480) \n'))
                
            # Check for good inputs and fix them if bad: 
        if wheel_command_left < -480: 
                wheel_command_left = -480
        elif wheel_command_left > 480: 
                wheel_command_left = 480
            
            # Pack the message object with the current data.
        wheel_command_left_msg.data = wheel_command_left
            
            #### CODE HERE ####
            # Add a input and publishing for the Right wheel
                    # use the Python "input" command to get a value. Use the int() function to turn the string into an integer. 
        wheel_command_right = int(input('Enter wheel command right (-480 to +480) \n'))
                
            # Check for good inputs and fix them if bad: 
        if wheel_command_right < -480: 
                wheel_command_right = -480
        elif wheel_command_right > 480: 
                wheel_command_right = 480
            
            # Pack the message object with the current data
        wheel_command_right_msg.data = wheel_command_right
            
            # Publish the message. 
        pub_wheel_command_right.publish(wheel_command_right_msg)
        time.sleep(.001)
        pub_wheel_command_left.publish(wheel_command_left_msg)
            #### END CODE ####
        
        #get encoder values for right and left wheel right at beginning of 5 seconds
        [leftEnc_pre,rightEnc_pre] = encoders.readEncoders()
        
        #run speed calculating functions
#        calc_speed_right()
#        calc_speed_right()
        
        L_command = wheel_command_left
        R_command = wheel_command_right 
        
        #sleep for specified amount of time in seconds
        time.sleep(run_time)
        
        #get encoder values for right and left wheel right after 5 seconds
        [leftEnc_post,rightEnc_post] = encoders.readEncoders()
        
        #manully set speed of both wheels to 0 
        wheel_command_right = 0
        wheel_command_left = 0
        
        wheel_command_left_msg.data = wheel_command_left
        wheel_command_right_msg.data = wheel_command_right
        
        pub_wheel_command_right.publish(wheel_command_right_msg)
        pub_wheel_command_left.publish(wheel_command_left_msg)
        
        #determine the change in encoder reading over the 5 seconds 
        V_left = (leftEnc_post - leftEnc_pre)/(run_time*12)
        V_right = (rightEnc_post - rightEnc_pre)/(run_time*12)
        
        print(V_left, V_right)
        
        # Enter some data
        
        xdata.append(L_command)
        ydata.append(V_left)
        # Use Matplotlib/Pyplot to plot it.
        # Note, many aspects are a lot like MATLAB plotting.
    fig = plt.figure() # create a Figure
    p = plt.plot(xdata,ydata,'o-r') # add a plot to it: first xdata, then ydata. "o-r" means "circle markers, with a line, red"
    plt.xlabel("Command Input")
    plt.ylabel("Speed [rad/s]")
    plt.title("Command vs. Speed")
    #plt.show()
        


# Section to start the execution, with Exception handling. 
    
if __name__ == "__main__": 
    try:
        talker_for_wheel_commands()
    except rospy.ROSInterruptException: 
        traceback.print_exc()
        pass
