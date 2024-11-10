

nasm -f elf64 add42.asm -o add42.o
gcc add42call.c add42.o -z noexecstack -o add42call
./add42call



