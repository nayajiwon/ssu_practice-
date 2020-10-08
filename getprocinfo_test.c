#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "date.h"
//#include "processInfo.h"
//#include "stdio.h"

int main(int argc, char *argv[])
{
	
	int maxpid, i;
	struct processInfo ProcessInfo; 

	maxpid = get_max_pid(); 

	printf(1,"PID      PPID    SIZE    Number of Context Switch\n");
	
	for(i=0; i<=maxpid; i++)
	{
		get_proc_info(i, &ProcessInfo); 
	}


	exit();
}

