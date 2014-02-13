#include "ros/ros.h"
#include <termios.h> 
#include <ecl/threads.hpp>
#include <std_msgs/UInt8.h>
#include <sstream>



bool 	quit_requested;
int 	key_file_descriptor;
struct 	termios original_terminal_state;
ecl::Thread thread;
ecl::Mutex  key_mutex;

char 	key_getch_data;  
int 	key_new;  

void Key_InputLoop( void );


int main( int argc, char **argv )
{
	ros::init(argc, argv, "Rover5_key_getch");
	ros::NodeHandle n;
	
	ros::Publisher key_pub = n.advertise<std_msgs::UInt8>("key_getch", 1000);
	
	ros::Rate loop_rate(10);
	
	
	//-- 초기화 
	//
	quit_requested = 0;
	tcgetattr(key_file_descriptor, &original_terminal_state);
	
	key_new = false;

	//-- 키보드 입력 스레드 시작 
	//
	thread.start(&Key_InputLoop);
	
	
	while( ros::ok() )
	{
		std_msgs::UInt8 key_msg;
		
		key_msg.data = key_getch_data;
		
		if( key_new == true )
		{
			key_pub.publish(key_msg);

			key_mutex.lock();
			key_new = false;
			key_mutex.unlock();
		}
		else
		{
			//key_msg.data = 0;
			//key_pub.publish(key_msg);			
		}

		ros::spinOnce();
		loop_rate.sleep();
	}	

	quit_requested = true;
	thread.cancel();
	thread.join();

	tcsetattr(key_file_descriptor, TCSANOW, &original_terminal_state);
}

  
  

void Key_InputLoop( void )
{
	struct termios raw;
	memcpy(&raw, &original_terminal_state, sizeof(struct termios));

	raw.c_lflag &= ~(ICANON | ECHO);
	
	// Setting a new line, then end of file
	raw.c_cc[VEOL] = 1;
	raw.c_cc[VEOF] = 2;
	tcsetattr(key_file_descriptor, TCSANOW, &raw);

	char c;
	while (!quit_requested)
	{
		if (read(key_file_descriptor, &c, 1) < 0)
		{
			perror("read char failed():");
			exit(-1);
		}
		else
		{
			ROS_INFO("Key Input : [%x]", c);
			key_getch_data = c;

			key_mutex.lock();
			key_new = true;
			key_mutex.unlock();			
		}
	}
}
