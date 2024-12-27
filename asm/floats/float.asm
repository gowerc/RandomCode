
.section .data
.LC0:
	.long	1067282596
    num2: .float 2.71
    result: .float 0.0
    msg: .asciz "hello world %f"

.global main
.extern printf
.section .text
main:
    push %rbp                  # Function prologue: align the stack
    mov %rsp, %rbp             # Function prologue

    movss num1(%rip), %xmm0    # Load num1 into XMM0
    movss num2(%rip), %xmm1    # Load num2 into XMM1
    addss %xmm1, %xmm0         # Add XMM1 to XMM0 (result in XMM0)

    leaq msg(%rip), %rdi       # Load address of format string into %rdi (first argument)

    call printf                # Call printf (XMM0 holds the float argument)

    movq $0, %rax              # Set return value to 0
    mov %rbp, %rsp             # Function epilogue: restore stack
    pop %rbp                   # Function epilogue
    ret                        # Return from main



