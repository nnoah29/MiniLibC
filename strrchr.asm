section .text
    global strrchr

strrchr:
    mov rax, 0
    mov rdx, rdi
    mov bl, sil
.Loop:
    cmp byte [rdx], bl
    jne .Next

    cmp byte [rdx], 0
    je .End

    mov rax, rdx
.Next:
    inc rdx
    jmp .Loop

.End:
    ret

