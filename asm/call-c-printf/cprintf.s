
.global main
.extern printf
.section .text
main:
    
    push %rbp         # Function prologue (this happens to also)
    movq %rsp, %rbp   # Function prologue 

    movq $0xAAAAAAAAAAAAAAAA, %rsi
    movq $0xBBBBBBBB0, %esi
    movq $0xCCCC, %si
    movq $0xDD, %sil

    leaq msg(%rip), %rdi   # Put message into first argument slot
    call printf     # Run the C function
    
    movq $0, %rax     # Set function return value
    movq %rbp, %rsp   # Function epilogue 
    pop %rbp          # Function epilogue 
    ret               # Function epilogue 

.section .data
    msg db "%016llX", 0x0a, 0x00
