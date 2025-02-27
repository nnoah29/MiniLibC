section .text
    global strcspn

    ; size_t strcspn(const char *s, const char *reject);
    ; str -> rdi
    ; reject -> rsi

strcspn:
    test rdi, rdi
    jz .not_found
    test rsi, rsi
    jz .not_found

    mov r8, rdi

.Loop_str:
    mov al, byte [r8]
    test al, al
    jz .found

    mov rcx, rsi
.Loop_reject:
    mov dl, byte [rcx]
    test dl, dl
    jz .next_char_str

    cmp al, dl
    je .found

    inc rcx
    jmp .Loop_reject

.next_char_str:
    inc r8
    jmp .Loop_str

.not_found:
    mov rax, 0
    ret

.found:
    sub r8, rdi
    mov rax, r8
    ret



