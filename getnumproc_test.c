#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "date.h"
//#include "stdio.h"

int main(int argc, char *argv[])
{

	int num; 
        num = get_num_proc(); 
        printf(1,"Total Number of Active Processes: %d\n", num);
	exit();
}

