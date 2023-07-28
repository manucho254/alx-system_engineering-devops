#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <stdio.h>

/**
 * infinite_while - infinate loop.
 *
 * Return: 0
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - function to create 5 zombie processes
 *
 * Return: 0 if success.
 */

int main(void)
{
	pid_t child_pid;
	int x;

	for (x = 0; x < 5; x++)
	{
		child_pid = fork(); /** create a child process */
		if (child_pid == 0)
		{
			/** this condition makes sure that we only create one child process */
			printf("Zombie process created, PID: %d\n", getpid());
			break;
		}
	}

	infinite_while();

	return (0);
}
