global _start
section .text
_start:

    ; Exit the program
    mov rax, 60         ; Syscall for exit
    mov rdi, array[200]        ; exit code 0
    syscall           ; 


section .data
    array dq "123456789"