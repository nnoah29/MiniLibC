section .text
    global strncmp

; int strncmp(const char *str1, const char *str2, size_t n);
; str1 -> rdi
; str2 -> rsi
; n -> rdx
strncmp:

.Loop:
    mov al, [rdi]
    mov bl, [rsi]

    cmp al, bl
    jne .Diff

    test al, al
    jz .End

    inc rdi
    inc rsi
    dec rdx
    jnz .Loop

.Diff:
    sub al, bl
    movsx rax, al
    ret

.Sup:
    mov rax, 1
    ret
.Inf:
    mov rax, -1
    ret
.End:
    mov rax, 0
    ret

