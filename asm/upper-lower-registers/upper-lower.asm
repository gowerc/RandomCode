
global main
extern printf
section .text
main:
    
    push rbp       ; Function prologue (this happens to also)
    mov rbp, rsp   ; Function prologue 

    mov rsi, 0xAAAAAAAAAAAAAAAA
    mov esi, 0xBBBBBBBB
    mov si,  0xCCCC
    mov sil, 0xDD

    mov rdi, msg   ; Put message into first argument slot
    call printf    ; Run the C function
    
    mov rax, 0     ; Set function return value
    mov rsp, rbp   ; Function epilogue 
    pop rbp        ; Function epilogue 
    ret            ; Function epilogue 

section .data
    msg db "%016llX", 0x0a, 0x00
