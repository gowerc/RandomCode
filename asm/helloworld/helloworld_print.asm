global _start

section .text

_start:
    mov [msg1], byte "d"
    mov rax, 1        ; Syscall for writing
    mov rdi, 1        ; File descriptor (1 = stdout)
    mov rsi, msg1      ; Our sting to write
    mov rdx, 20        ; Length of string to write
    syscall           ;
    ; Exit the program
    mov rax, 60       ; Syscall for exit
    mov rdi, 0        ; exit code 0
    syscall           ; 


section .data
    msg1: db "Hello, World!"
    msg2: db "Hi there"

; In memory our data is therefore
;
; X            Y
; Hello, World!Hi there
; 
; where msg1 -> X
;       msg2 -> Y