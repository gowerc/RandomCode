#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    pid_t pid;
    pid = fork();  // Child process is assigned a 0 
                   // Parent is given a number > 0
    if (pid < 0) {
        perror("Fork failed");
        return 1;
    } else if (pid == 0) { // Child process
        printf("In the child process. Executing 'ls' command...\n");
        execl("/bin/ls", "ls", "-l", NULL);
        perror("exec failed");
        return 1;
    } else {
	    int status;
        pid_t child_pid = wait(&status);  // Wait for the child process to finish

        if (WIFEXITED(status)) {  // Check if child exited normally
            int exit_status = WEXITSTATUS(status);  // Get exit status
            printf("Child PID: %d exited with status: %d\n", child_pid, exit_status);
        } else {
            printf("Child did not exit normally\n");
        }
    }
    return 0;
}

