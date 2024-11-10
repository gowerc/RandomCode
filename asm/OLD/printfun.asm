global _start
section .text
_start:

    ; Run our print function on msg1
    mov rdi, msg1     ; Assign message location to 1st argument register
    mov rsi, msg1len  ; Assign message length to 2nd argument register
    call print
    
    ; Run our print function on msg2
    mov rdi, msg2     ; Assign message location to 1st argument register
    mov rsi, msg2len  ; Assign message length to 2nd argument register
    call print

    ; Exit the program
    mov rax, 60       ; Syscall for exit
    mov rdi, 0        ; exit code 0
    syscall           ; 


print:
    ; prolog
    push rbp       ; Save current base-pointer value as this must be preserved
    mov rbp, rsp   ; Set base-pointer to current stack value
    
    ; Print message to stdout
    mov rdx, rsi   ; Length of string to write (from 2nd argument register)
    mov rsi, rdi   ; Our sting to write (from 1st argument register)
    mov rax, 1     ; Syscall for writing
    mov rdi, 1     ; File descriptor (1 = stdout)
    syscall        ;
    
    ; epilog
    mov rsp, rbp   ; Clear stack by restoring basepointer value
    pop rbp        ; Restore previous base pointer value
    ret

section .data
    msg1: db "Hello, World!", 0x0A
    msg1len: equ $ - msg1
    msg2: db "This is my second string", 0x0A
    msg2len: equ $ - msg2

