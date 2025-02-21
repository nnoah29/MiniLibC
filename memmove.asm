section .text
    global memmove

; void *memcpy(void *dest, const void *src, size_t n);
; dest -> rdi
; src -> rsi
; n -> rdx;

memmove:
    cmp rdi, rsi
    jae .overlap

.no_overlap:
    mov rcx, rdx       ; Charger n dans rcx
    rep movsb          ; Copier rcx octets de [rsi] à [rdi]
    ret

.overlap:
    lea rsi, [rsi + rdx - 1] ; déplacer src à la fin de son block mémoire
    lea rdi, [rdi + rdx - 1] ; déplacer dest à la fin de son block mémoire aussi
    std                      ; inverser les sens de direction
    mov rcx, rdx             ; Charger n dans rcx
    rep movsb                ; Copier rcx octets de [rsi] à [rdi] en sens inverse
    cld                      ; remettre les sens en ordre
    ret

