#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"
#include "processInfo.h"


/*
struct {
	struct spinlock lock;
	struct proc proc[NPROC];
} ptable;
*/

int
sys_get_prior(void)
{
	return get_prior();
        //cprintf("Maximum PID: %d\n", maxpid);
}

int
sys_set_prior(void)
{
	int getN;  
	argint(0, &getN);

	return set_prior(getN); 
}




int
sys_get_proc_info(void)
{
	
	int pid, res; 
	struct processInfo ProcessInfo; 
	argint(0, &pid);
        argptr(1, (void *)&ProcessInfo, sizeof(ProcessInfo)); 

	res = get_proc_info(pid, &ProcessInfo); 
	if(res<0)
		return -1; 
	else if(res>=0)
	{
		cprintf("%d         ", pid);
		cprintf("%d      ", ProcessInfo.ppid);
		cprintf("%d     ", ProcessInfo.psize);
		cprintf("%d     \n", ProcessInfo.numberContextSwitches);
		
		return 1; 
	}
	else 
		return -1;
	
}	

int
sys_get_max_pid(void)
{
	return get_max_pid();
}


int
sys_get_num_proc(void)
{
	return get_num_proc();
}


int
sys_hello_name(void)
{

	char* name;
	argstr(0,&name);
	cprintf("hello %s \n",name);
	return 1;
}


int
sys_hello(void)
{
	cprintf("helloxv6\n");
	return 1;
}



int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
