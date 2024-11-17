global _start
section .text
_start:
    ; Open the file
    mov rax, 2        ; Syscall to open the file
    mov rdi, file     ; Name of file to open
    mov rsi, 0x241    ; Open mode = create + write only
    mov rdx, 0q666    ; file permissions to set if creating
    syscall           ;
    mov r9, rax       ; Store file descriptor for later

    ; Write to the file
    mov rax, 1        ; Syscall for writing
    mov rdi, r9       ; File descriptor (1 = stdout)
    mov rsi, msg      ; Our sting to write
    mov rdx, msglen   ; Length of string to write
    syscall           ;

    ; Close the file
    mov rax, 3        ; Syscall for closing file
    mov rdi, r9       ; File descriptor 
    syscall           ;

    ; Exit the program
    mov rax, 60       ; Syscall for exit
    mov rdi, 0        ; exit code 0
    syscall           ; 

section .data
    file: db "test.txt", 0x00
    msg: db "Hello, World!"
    msglen: equ $ - msg






