extern _mprotect
extern _perror

extern _ft_memset
extern _ft_bzero
%define PROT_READ 0x01
%define PROT_WRITE 0x02
%define PROT_EXEC 0x04
%define SYSCALL(n) (0x2000000 | n)
%define MPROTECT 74

section	.text

	;; takes the address of the section and the size of it in arguments
global	_trash_text_code
_trash_text_code:
	push rbp
	mov rbp, rsp
	sub	rsp, 8

	push rdi
	push rsi

	mov rax, 4095
	not rax
	and rdi, rax
	mov rdx, PROT_WRITE | PROT_READ | PROT_EXEC
	call _set_mem_zone_prot
	jb  .end 					;_abort_crash

	pop rsi
	pop rdi
	mov rdx, rsi
	mov rsi, 42
	call _ft_memset
.end:
	add rsp, 8
	pop rbp
	ret

	;; Takes addr, size, and prot as arguments
_set_mem_zone_prot:
	push rbp
	sub rsp, 8
	mov rax, SYSCALL(MPROTECT)
	; call _mprotect
	syscall
;;	call _print_errno
	add rsp, 8
	pop rbp
	ret

_abort_crash:
	push rax
	ret
_print_errno:
	push rbp
	mov rdi, 0
	call _perror
	pop rbp
	ret
