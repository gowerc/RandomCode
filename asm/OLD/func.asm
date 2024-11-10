global _start
section .text
_start:
    ; Write to the file
    mov r8, 5         ; x
    mov r9, 3         ; y
    mov r10, 0        ; starting value for result
loop:
    add r10, r8       ; r10 =  r10 + 5
    dec r9            ; r9 = r9 -1
    cmp r9, 1         ; if (r9 >= 1) goto "loop"
    jge loop          ;
    
    ; Exit the program
    mov rax, 60       ; Syscall for exit
    mov rdi, r10      ; exit code
    syscall           ; return result as exit code













