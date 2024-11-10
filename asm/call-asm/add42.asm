

        global  add42
        section .text
add42:
        push rbp      ; prologue
        mov rbp, rsp  ; prologue
        
        ; rax is the functions return value
        ; rdi is the first input argument
        mov rax, rdi
        add rax, 42
        
        mov rsp, rbp   ; epilogue
        pop rbp        ; epilogue
        ret            ; epilogue


