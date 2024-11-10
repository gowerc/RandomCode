
nasm -f elf64 printf_c.asm -o printf_c.o 
gcc -m64 -z noexecstack printf_c.o -o printf_c 
./printf_c