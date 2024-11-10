
global main
extern printf

section .text
main:
    
    push rbp       ; Function prologue (this happens to also)
                   ; align the stack
    mov rbp, rsp   ; Function prologue 

    ;lea rsp, [rsp -3]   ; If this line is uncommented then the 
                         ; program will crash as the stack is
                         ; no longer aligned

    lea rsp, [rsp - 16]  ; This line doesn't crash the program
                         ; as we've increased the stack by a
                         ; multiple of 16

    mov rdi, msg   ; Put message into first argument slot
    mov rsi, 5     ; Put int to second argument slot
    call printf    ; Run the C function
    
    mov rax, 0     ; Set function return value
    
    mov rsp, rbp   ; Function epilogue 
    pop rbp        ; Function epilogue 
    ret            ; Function epilogue 

section .data
    msg db "Hello, world! int = %i", 0x0a, 0x00


