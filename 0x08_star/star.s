section .bss
    n: resb 1

section .data
    newline: db 10
    star: db '*' ; 미리 별을 정의함

section .text
    global _start

_start:
    ; INPUT n
    mov rax, 0x0
    mov rdi, 0x0
    mov rsi, n
    mov rdx, 1
    syscall

    ; n을 int로, r12, r14에 저장
    mov r12, [n]
    sub r12, '0'
    mov r14, r12
    
; 바깥 loop
loop:
    cmp r12, 0 ; r12가 0이면
    je exit ; 프로그램 종료

    ; rax = r14 - r12 + 1 == 찍을 별 개수
    ; ==> n - i + 1
    mov rax, r14
    sub rax, r12
    inc rax
    mov r13, rax

print_star:
    ; r13이 0이면
    cmp r13, 0
    ; 줄바꿈 == 별을 다 찍을만큼 찍었다
    je print_line
    
    ; 별찍기
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, star
    mov rdx, 0x1
    syscall

    ; r13번 만큼 반복하기 위함
    dec r13
    ; 다시 반복 (FOR문 참고)
    jmp print_star

print_line:
    ; 줄바꿈
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, newline
    mov rdx, 0x1
    syscall
    
    ; r12 감소 (count 감소)
    dec r12
    ; loop로 다시 돌아가서 반복
    jmp loop

exit:
    ; return 0;
    mov rax, 60
    mov rdi, 0
    syscall
 
