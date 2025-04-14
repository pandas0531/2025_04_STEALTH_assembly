section .data
    msg db "Hello, assembly!" ; DB에 출력할 문자열을 저장해둠

section .text
    global _start ; _start 함수를 정의함

_start:
    ; write syscall을 사용해서 출력을 할거임
    mov rax, 1 ; rax에 1을 넣어서 write 함수를 call 할거고
    mov rdi, 1 ; 출력설정
    mov rsi, msg ; .data에서 db에 저장해놓은 msg를 출력할거임
    mov rdx, 16 ; 출력의 길이를 설정
    syscall

    ; return 0
    mov rax, 60
    mov rdi, 0
    syscall
