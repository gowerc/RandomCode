
# nasm -f elf64 call-c-printf/cprintf.asm -o bin/cprintf.o 
# gcc -m64 -z noexecstack bin/cprintf.o -o bin/cprintf



gcc  -o bin/cprintf call-c-printf/cprintf.s
./bin/upper-lower

