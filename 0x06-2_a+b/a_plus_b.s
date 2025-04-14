section .bss
    buf: resb 10
    ; buf를 설정하고, 숫자를 하나씩 읽는게 아니라
    ; 한줄을 그대로 읽고, 거기서 숫자를 긁어옴
    res: resb 0x4 ; 결과값 저장
    
section .text
    global _start ; _start 함수 설정

_start:
    mov rax, 0x0 ; read syscall
    mov rdi, 0x0
    mov rsi, buf ; 입력받고 buf에 저장
    mov rdx, 10 ; 최대 10만큼 받기
    syscall

    mov al, [buf] ; buf[0]의 값을 al에 저장
    sub al, '0' ; '0'을 빼줌으로써 int형 숫자로 만듦
    
    mov ah, [buf+2] ; buf[2]의 값을 ah에 저장
    ; why? buf[1]은 공백으로 두고 입력을 했으니깐
    sub ah, '0' ; 똑같이 int로 만듦
   
    add al, ah ; al에 ah를 더함 (a+b == al+ah)
    add al, '0' ; str형으로 바꿈
    
    mov [res], al ; res의 값을 al로 정함
    
    mov rax, 0x1 ; write syscall
    mov rdi, 0x1
    mov rsi, res ; res를 출력함
    mov rdx, 1  
    syscall    
 
    ; return 0
    mov rax, 60
    mov rdi, 0
    syscall
