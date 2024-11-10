
nasm -f elf64 exit.asm -o exit.o
ld exit.o -o exit -m elf_x86_64
./exit
echo $?

