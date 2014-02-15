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

#include "./Main_Lib/Define.h"

#include "./Main_Lib/Uart_Lib.h"
#include "./Main_Lib/Uart_Sig_Lib.h"
                                                                                                 
#include "./Main_Lib/Uart_Lib.c"
#include "./Main_Lib/Uart_Sig_Lib.c"




#define  AP_STRCMD_FRAME_OPCODE		'#'
#define  AP_STRCMD_FRAME_PRINT		'*'
#define  AP_STRCMD_FRAME_RET		'>'
#define  AP_STRCMD_FRAME_INFO		'@'


#define  AP_STRCMD_FRAME_OK			'O'
#define  AP_STRCMD_FRAME_FAIL		'F'




int Lib_Motor_Debug = 0;
int Lib_Motor_Enable = 0;

int Lib_Motor_PwmLeft  = 0;
int Lib_Motor_PwmRight = 0;

int Sonic_Length_Right  = 0;
int Sonic_Length_Left   = 0;



char Uart_CmdStr[100];
int  Uart_CmdIndex = 0;

char Uart_CmdCode[50];
int  Uart_CmdArg[10];



void Uart_CmdExe( char *pCmd )
{
	if( pCmd[0] == AP_STRCMD_FRAME_INFO )
	{
		//printf("Receive Info\n");
		//sscanf(pCmd)
		if( strncmp( &pCmd[5], "SONIC",5 ) == 0 )
		{
			sscanf( &pCmd[5], "%s %d %d", Uart_CmdCode, &Uart_CmdArg[0], &Uart_CmdArg[1] );

			printf("SONIC %d %d\n", Uart_CmdArg[0], Uart_CmdArg[1] );
			Sonic_Length_Right = Uart_CmdArg[0];	
			Sonic_Length_Left  = Uart_CmdArg[1];	
		}
	}
}



void Uart_Rxd_Func( char Data )
{
	static int Uart_CmdReceived = 0;

	//printf(" (%c->%x) ", Data, Data );

	if( Uart_CmdIndex < 100-1 )
	{
		Uart_CmdStr[ Uart_CmdIndex++ ] = Data;


		if( Data == 0x0A )
		{
			Uart_CmdStr[ Uart_CmdIndex ] = 0;

			Uart_CmdExe( Uart_CmdStr );

			Uart_CmdIndex = 0;
			//printf("Receive Info11111  %c \n", Uart_CmdStr[0]);
		}
	}
	else
	{
		Uart_CmdIndex = 0;
	}
}





bool rover5_cmd_pwm( rover5_ros::rover5_node_cmd_pwm::Request &req,
					 rover5_ros::rover5_node_cmd_pwm::Request &res )
{

	Lib_Motor_PwmLeft  = req.pwm_left;
	Lib_Motor_PwmRight = req.pwm_right;

	Uart_Printf( "move pwm  %d  %d \n", Lib_Motor_PwmLeft, Lib_Motor_PwmRight);

	return true;
}





int main( int argc, char **argv )
{
	int  Uart_Handle_Ptr;


	ros::init(argc, argv, "rover5_node");
	ros::NodeHandle n;

	ros::Publisher     pub = n.advertise<rover5_ros::rover5_node_msg>("rover5_node_msg", 1000);
	ros::ServiceServer srv = n.advertiseService("rover5_node_cmd_pwm", rover5_cmd_pwm); 

	//-- 시리얼 통신 초기화 
	Uart_Handle_Ptr = Uart_Open( "/dev/ttyUSB0", BAUD_115200 );

	if( Uart_Handle_Ptr < 0 )
	{
		printf("Uart Open Failed \n");
		//return 0;
	}
	else
	{
		Uart_Sig_Init( Uart_Handle_Ptr );
		Uart_Sig_Func_Init( Uart_Handle_Ptr, Uart_Rxd_Func );
	}

	ros::Rate loop_rate(10);


	while( ros::ok() )
	{
		rover5_ros::rover5_node_msg msg;

		//-- PWM Info
		msg.pwm_left  = Lib_Motor_PwmLeft;
		msg.pwm_right = Lib_Motor_PwmRight;

		//-- Sonic Info
		msg.sonic_distance_left  = Sonic_Length_Left;
		msg.sonic_distance_right = Sonic_Length_Right;

		pub.publish(msg);

		ros::spinOnce();
		loop_rate.sleep();
	}

	return 0;	
}
