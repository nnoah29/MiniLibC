section .text
    global memcpy

; void *memcpy(void *dest, const void *src, size_t n);
; dest -> rdi
; src -> rsi
; n -> rdx;

memcpy:
    test rdx, rdx
    je .oki

    mov rcx, rdx       ; Charger n dans rcx
    rep movsb          ; Copier rcx octets de [rsi] à [rdi]

.oki:
    ret

