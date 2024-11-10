



#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>

int number = 0;

void sigterm_handler(int signalNumber) {
    printf("Exiting Program\n");
    exit(0);
}

void siguser_handler(int signalNumber) {
    printf("Handled signal\n");
    number = 10;
}

int main() {
    signal(SIGTERM, sigterm_handler);
    signal(SIGUSR1, siguser_handler);
    while(1) {
        printf("%i\n", number);
        sleep(2);
    }
}

