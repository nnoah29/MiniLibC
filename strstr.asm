section .text
    global strstr

strstr:
    mov rax, rdi
    test rsi, rsi
    jz .found

.Loop:
    mov rbx, rax
    mov rcx, rsi

.search:
    mov dl, byte [rcx]
    cmp dl, 0
    je .found

    mov dh, byte [rbx]
    cmp dh, 0
    je .not_found

    cmp dl, dh
    jne .Next

    inc rcx
    inc rbx
    jmp .search

.Next:
    inc rax
    cmp byte [rax], 0
    jne .Loop

.not_found:
    mov rax, 0
    ret

.found:
    ret



