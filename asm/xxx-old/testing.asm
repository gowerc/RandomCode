global _start
section .text
_start:

    ; Run our print function on msg1
    mov dword [msg1 + 1], 0x6464
    mov rdi, msg1     ; Assign message location to 1st argument register
    mov rsi, 8        ; Assign message length to 2nd argument register
    call print
    
    ; ; Run our print function on msg1
    ; ;mov [msg2 + 1], byte 0x78
    ; mov rdi, msg2     ; Assign message location to 1st argument register
    ; mov rsi, 8        ; Assign message length to 2nd argument register
    ; call print
    
    ;     ; Run our print function on msg1
    ; mov rdi, msg3     ; Assign message location to 1st argument register
    ; mov rsi, 8        ; Assign message length to 2nd argument register
    ; call print
    
    ;     ; Run our print function on msg1
    ; mov [msg4 + 1], dword 0x7369
    ; mov rdi, msg4     ; Assign message location to 1st argument register
    ; mov rsi, 8        ; Assign message length to 2nd argument register
    ; call print

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
    msg1: db "S", "i", "n", "g", "l", "e", "s", "!"
    msg2: dw "S", "i", "n", "g", "l", "e", "s", "!"
    msg3: dd "S", "i", "n", "g", "l", "e", "s", "!"
    msg4: dq "S", "i", "n", "g", "l", "e", "s", "!"
