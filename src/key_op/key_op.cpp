#include "ros/ros.h"
#include <termios.h> 
#include <ecl/threads.hpp>
#include <std_msgs/UInt8.h>
#include <sstream>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/select.h>
#include <termios.h>
#include <time.h>

#include "rover5_ros/rover5_node_msg.h"
#include "rover5_ros/rover5_node_cmd_pwm.h"





int Lib_Motor_PwmLeft  = 0;
int Lib_Motor_PwmRight = 0;




char 	key_getch_data;  


void key_getch_callback( const std_msgs::UInt8::ConstPtr &msg )
{
	ROS_INFO("Key Code : %X", msg->data);
	
	int Speed = 30;


	switch( msg->data )
	{
		case 0x41:	// For
			Lib_Motor_PwmLeft  = Speed;
			Lib_Motor_PwmRight = Speed;
			break;

		case 0x44:	// Left
			Lib_Motor_PwmLeft  = -Speed*2;
			Lib_Motor_PwmRight = Speed*2;			
			break;

		case 0x43:	// Right
			Lib_Motor_PwmLeft  = Speed*2;
			Lib_Motor_PwmRight = -Speed*2;
			break;

		case 0x42:	// Back
			Lib_Motor_PwmLeft  = -Speed;
			Lib_Motor_PwmRight = -Speed;
			break;

		default:
			Lib_Motor_PwmLeft  = 0;
			Lib_Motor_PwmRight = 0;
			break;
	}
}



int main( int argc, char **argv )
{
	int  Uart_Handle_Ptr;


	ros::init(argc, argv, "key_op");
	ros::NodeHandle n;

	ros::ServiceClient client = n.serviceClient<rover5_ros::rover5_node_cmd_pwm>("rover5_node_cmd_pwm");
	ros::Subscriber    sub    = n.subscribe<std_msgs::UInt8>("key_getch", 1, key_getch_callback);

	ros::Rate loop_rate(10);

	ROS_INFO("Start key_op");

	rover5_ros::rover5_node_cmd_pwm cmd_pwm;

	while( ros::ok() )
	{
		cmd_pwm.request.pwm_left = Lib_Motor_PwmLeft;
		cmd_pwm.request.pwm_right = Lib_Motor_PwmRight;

		if( client.call( cmd_pwm ) )
		{
			ROS_INFO("Call pwm %d %d", Lib_Motor_PwmLeft, Lib_Motor_PwmRight );	
		}
		else
		{
			ROS_ERROR("Failed to call cmd_pwm");
		}

		ros::spinOnce();
		loop_rate.sleep();
	}

	return 0;	
}
