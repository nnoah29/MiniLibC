section .text
    global strpbrk

    ; char *strpbrk(const char *str, const char *accept)
    ; str -> rdi
    ; accept -> rsi

strpbrk:
    test rdi, rdi
    jz .not_found
    test rsi, rsi
    jz .not_found

.Loop_str:
    mov al, byte [rdi]
    test al, al
    jz .not_found

    mov rcx, rsi
.Loop_accept:
    mov dl, byte [rcx]
    test dl, dl
    jz .next_char_str

    cmp al, dl
    je .found

    inc rcx
    jmp .Loop_accept

.next_char_str:
    inc rdi
    jmp .Loop_str

.not_found:
    mov rax, 0
    ret

.found:
    mov rax, rdi
    ret



