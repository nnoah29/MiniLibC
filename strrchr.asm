section .text
    global strrchr

strrchr:
    mov rax, 0
    mov rdx, rdi
    mov bl, sil
.Loop:
    cmp byte [rdx], 0
    je .End

    cmp byte [rdx], bl
    jne .Next

    mov rax, rdx
.Next:
    inc rdx
    jmp .Loop

.End:
    ret

