section .bss
    n: resb 1 ; 입력값을 저장함

section .data
    newline db 10 ; 줄바꿈

section .text
    global _start
 
_start:
    ; input n
    mov rax, 0x0
    mov rdi, 0x0
    mov rsi, n  
    mov rdx, 1
    syscall

    ; r12레지스터에 n을 저장
    ; WHY? ecx나 al 같은 애들은 syscall하면 값이 덮임
    ; r12가 아니여도 영향을 안받는 친구면 상관 ㄴㄴ
    mov r12, [n]
    sub r12, '0' ; typeof(r12) == int

loop:
    cmp r12, 0 ; r12가 0이되면
    je exit ; exit로 점프

    ; n값 출력
    mov rax, 1
    mov rdi, 1
    mov rsi, n
    mov rdx, 1
    syscall

    ; 줄바꿈
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    
    ; n을 int로 변환
    mov al, [n]
    sub al, '0'
    ; n을 1 뺴줌
    dec al
    ; n을 str로 바꿈
    mov [n], al
    mov al, [n]
    add al, '0'
    mov [n], al

    ; 카운트 1회 감소
    dec r12
    ; 다시 loop로 점프 (반복)
    jmp loop

exit:
    ; return 0
    mov rax, 60
    xor rdi, rdi
    syscall
