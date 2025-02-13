section .text
    global strlen

strlen:
    mov rax, rdi
.Loop:
    cmp byte [rax], 0
    je .End
    inc rax
    jmp .Loop
.End:
    sub rax, rdi
    ret
