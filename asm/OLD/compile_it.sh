nasm -f elf64 helloworld.asm -o helloworld.o

gcc -m64 helloworld.o -o helloworld -z noexecstack

ld helloworld.o -o helloworld

./helloworld



nasm -f elf64 exit.asm -o exit.o
ld exit.o -o exit -m elf_x86_64
./exit
echo $?


nasm -f elf64 helloworld.asm -o helloworld.o
ld helloworld.o -o helloworld -m elf_x86_64
./helloworld

gcc flags.c -o flags


nasm -f elf64 helloworld.asm -o helloworld.o
gcc -m64 -nostdlib -e _start helloworld.o -o helloworld





nasm -f elf64 stack.asm -o stack.o
gcc -m64 -nostdlib -e _start stack.o -o stack
./stack


nasm -f elf64 func.asm -o func.o
gcc -m64 -nostdlib -e _start func.o -o func
./func
echo $?


nasm -f elf64 printfun.asm -o printfun.o
gcc -m64 -nostdlib -e _start printfun.o -o printfun
./printfun



nasm -f elf64 callc.asm -o callc.o
gcc -m64 -z noexecstack callc.o -o callc
./callc


nasm -f elf64 testing.asm -o testing.o
gcc -m64 -nostdlib testing.o -o testing -e _start
./testing


s  d   d   0   0   e   s   !
s  i   n   g   l   e   s   !