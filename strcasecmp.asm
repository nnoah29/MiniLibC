section .text
    global strcasecmp

; int strcasecmp(const char *str1, const char *str2);
; str1 -> rdi
; str2 -> rsi

to_lower:
    cmp al, 'A'
    jl .oki
    cmp al, 'Z'
    jg .oki
    add al, 32
    jmp .oki
.oki:
    ret

strcasecmp:
.Loop:
    mov al, byte [rdi]
    call to_lower
    mov bl, al

    mov al, byte [rsi]
    call to_lower
    mov bh, al

    cmp bl, bh
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

