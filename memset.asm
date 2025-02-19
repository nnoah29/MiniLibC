section .text
    global memset

; void *memset(void *s, int c, size_t n);
; s -> rdi
; c -> esi
; n -> rdx

memset:
    mov rax, rdi
.Loop:
    test rdx, rdx ; if n == 0
    je .oki
    mov byte [rdi], sil ;*s = c
    inc rdi ; *s++
    dec rdx ;n--
    jmp .Loop
.oki:
    ret
