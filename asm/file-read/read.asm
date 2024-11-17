.section .data
    filename: .asciz "example.txt"   # Null-terminated string for the file name
    buffer:   .space 128             # Buffer to hold file contents
    msg_len:  .quad 0                # Variable to store the read length

.section .text
    .globl _start


    #   %rax=0       %rdi               %rsi         %rdx    
    # sys_write(unsigned int fd, const char *buf, size_t count)

    #   %rax=0       %rdi           %rsi         %rdx    
    # sys_read (unsigned int fd, char *buf, size_t count)

    #   %rax=2            %rdi          %rsi       %rdx   
    # sys_open(const char *filename, int flags, int mode)


_start:
    # Read from the file (sys_read)
    movq $2, %rax                    # sys_open
    leaq filename(%rip), %rdi        # Pointer to the file name - RIP relative addressing
    movq $0, %rsi                    # O_RDONLY
    syscall

    # Save the file descriptor
    movq %rax, %r12                  # Store the file descriptor in %r12

    # Open the file (sys_open)
    movq $0, %rax                    # sys_read
    movq %r12, %rdi                  # File descriptor
    leaq buffer(%rip), %rsi          # Buffer to read into
    movq $128, %rdx                  # Number of bytes to read
    syscall

    # Save the read length
    movq %rax, msg_len(%rip)         # Store the read length


    # Close the file (sys_close)
    movq $3, %rax                    # sys_close
    movq %r12, %rdi                  # File descriptor
    syscall

    # Write to stdout (sys_write)
    movq $1, %rax                    # sys_write
    movq $1, %rdi                    # File descriptor for stdout
    leaq buffer(%rip), %rsi          # Buffer containing the data
    movq msg_len(%rip), %rdx         # Number of bytes to write
    syscall
    
    # Messing around to see what we can get the console to print
    # leaq msg_len(%rip), %rsi
    # movq $100, %rdx
    # movq $500, %rdx
    # movq $0x4344, [msg_len]  
    # syscall

    # Exit the program (sys_exit)
    movq $60, %rax                   # sys_exit
    xorq %rdi, %rdi                  # set exit code - efficient form of  movq $0, %rdi
    syscall
