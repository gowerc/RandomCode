
nasm -f elf64 upper-lower-registers/upper-lower.asm -o bin/upper-lower.o 
gcc -m64 -z noexecstack bin/upper-lower.o -o bin/upper-lower 
./bin/upper-lower