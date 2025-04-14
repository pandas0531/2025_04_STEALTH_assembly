section .bss
    a: resb 0x4 ; 0x4의 a를 사용할거라고 지정

section .text
    global _start ; _start 함수를 지정

_start:
    ; read
    mov rax, 0x0 ; read syscall을 사용하기 위함
    mov rdi, 0x0
    mov rsi, a ; 입력받아서 a에 저장함
    mov rdx, 1 ; 입력받을 길이를 지정함
    syscall

    ; write
    mov rax, 0x1 ; write syscall을 사용하기 위함
    mov rdi, 0x1
    mov rsi, a ; 출력할것을 지정함
    mov rdx, 1 ; 출력할 길이를 지정함
    syscall

    ; return 0 (설명 생략)
    mov rax, 60
    mov rdi, rdi
    syscall

