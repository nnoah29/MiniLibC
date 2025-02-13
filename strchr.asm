section .text
    global strchr

strchr:
    mov rax, rdi
    mov bl, sil
.Loop:
    cmp byte [rax], bl
    je .Found

    cmp byte [rax], 0
    je .NotFound

    inc rax
    jmp .Loop
.Found:
    ret

.NotFound:
    mov rax, 0
    ret
