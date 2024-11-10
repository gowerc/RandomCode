
; global main
; extern printf
; section .text
; main:
    
;     push rbp       ; Function prologue
;     mov rbp, rsp   ; Function prologue 

;     add rsp, 16

;     ; mov [rsp],  dword 0xAAAAAAAAAAAAAAAA
;     ; mov [rsp], dword 0xBBBBBBBB
;     ; mov [rsp], word 0xCCCC
;     ; mov [rsp], byte 0xDD
;     ; mov [rsp + 9], byte 0x00 

;     mov rsi, 5
;     mov rdi, msg   ; Put message into first argument slot
;     call printf    ; Run the C function
    
;     mov rax, 0     ; Set function return value
;     mov rsp, rbp   ; Function epilogue 
;     pop rbp        ; Function epilogue 
;     ret            ; Function epilogue 

; section .data
;     msg db "%016llX", 0x0a, 0x00

global main
extern printf
section .text
main:
    
    push rbp       ; Function prologue
    mov rbp, rsp   ; Function prologue 
    
    sub rsp, 64
    
    mov [rsp + 0 ], byte "A"
    mov [rsp + 1 ], byte "B"
    mov [rsp + 2 ], byte "C"
    mov [rsp + 3 ], byte "D"
    mov [rsp + 4 ], byte "E"
    mov [rsp + 5 ], byte "F"
    mov [rsp + 6 ], byte "G"
    mov [rsp + 7 ], byte "H"
    mov [rsp + 8 ], byte "I"
    mov [rsp + 9 ], byte "J"
    mov [rsp + 10 ], byte "K"
    mov [rsp + 11 ], byte "L"
    mov [rsp + 12 ], byte "M"
    mov [rsp + 13 ], byte "N"
    mov [rsp + 14 ], byte "O"
    mov [rsp + 15 ], byte "P"
    mov [rsp + 16 ], byte "Q"
    mov [rsp + 17 ], byte 0x00

    mov qword rax, "ghijklm"
    mov ax, word 0x7374
    mov [rsp+6], rax
    ; mov [rsp+1], word "pq"


    mov rsi, rsp
    mov rdi, msg   ; Put message into first argument slot
    call printf    ; Run the C function

    mov rax, 0     ; Set function return value
    mov rsp, rbp   ; Function epilogue 
    pop rbp        ; Function epilogue 
    ret            ; Function epilogue 

section .data
    msg db "Hi %s There", 0x0a, 0x00
