

#include <fcntl.h>
#include <stdio.h>

int main() {
    printf("O_APPEND value: 0x%x\n", O_APPEND);
    printf("O_CREAT value: 0x%x\n", O_CREAT);
    printf("O_RDONLY value: 0x%x\n", O_RDONLY);
    printf("O_RDWR value: 0x%x\n", O_RDWR);
    printf("O_TRUNC value: 0x%x\n", O_TRUNC);
    printf("O_WRONLY value: 0x%x\n", O_WRONLY);
    return 0;
}