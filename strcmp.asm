section .text
    global strcmp

; int strcmp(const char *str1, const char *str2);
; str1 -> rdi
; str2 -> rsi
strcmp:
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
    jmp .Loop
.Sup:
    mov rax, 1
    ret
.Inf:
    mov rax, -1
    ret
.End:
    mov rax, 0
    ret

