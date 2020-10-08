#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "date.h"
//#include "stdio.h"

int main(int argc, char *argv[])
{
	int max;
        max = get_max_pid(); 
	printf(1, "Maximum PID: %d\n", max);

        exit();
}

