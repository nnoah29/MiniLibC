section .text
    global strncmp

; int strncmp(const char *str1, const char *str2, size_t n);
; str1 -> rdi
; str2 -> rsi
; n -> rdx
strncmp:
.Loop:
    mov al, [rdi]
    mov dl, [rsi]
    cmp al, dl
    je .Equal
    jg .Sup
    jl .Inf
.Equal:
    cmp byte [rdi], 0
    je .End
    inc rdi
    inc rsi
    dec rdx
    jnz .Loop
.Sup:
    mov rax, 1
    ret
.Inf:
    mov rax, -1
    ret
.End:
    mov rax, 0
    ret

