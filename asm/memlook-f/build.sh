


nasm -f elf64 memlook.asm -o memlook.o 
gcc -m64 -z noexecstack memlook.o -o bin/memlook 
./memlook


<pre><code class="language-nasm">
mov qword rax, "ghijklm"
mov rax, qword "ghijklm"
</code></pre>



