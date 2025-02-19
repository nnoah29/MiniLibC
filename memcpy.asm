section .text
    global memcpy

; void *memcpy(void *dest, const void *src, size_t n);
; dest -> rdi
; src -> rsi
; n -> rdx;

memcpy:
.Loop:
    test rdx, rdx ; if n == 0
    je .oki
    mov al, [rsi]
    mov [rdi], al
    inc rdi ; *dest++
    inc rsi ; *src++
    dec rdx ; n--
    jnz .Loop
.oki:
    ret
