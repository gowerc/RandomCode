global _start
section .text
_start:
    ; Write to the file
    mov rax, 1                  ; Syscall for writing
    mov rdi, 1                  ; File descriptor (1 = stdout)
    mov dword [rsp+4], 0x6C
    mov rsi, rsp                ; Our string to write
    mov rdx, 1                  ; Length of string to write
    syscall                     ;

    ; Exit the program
    mov rax, 60       ; Syscall for exit
    mov rdi, 0        ; exit code 0
    syscall           ; 


