nasm -f elf64 helloworld.asm -o helloworld.o
ld helloworld.o -o helloworld -m elf_x86_64
./helloworld