extern _perror

extern _ft_memset
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
	jb  .end_err

	mov rdi, qword [rbp - 16]
	mov rsi, 42
	mov rdx, qword [rbp - 24]
	call _ft_memset

	pop rsi
	pop rdi

	mov rax, 4095
	not rax
	and rdi, rax
	mov rdx, PROT_READ | PROT_EXEC
	call _set_mem_zone_prot
	jb	.end_err
.end:
	add rsp, 8
	leave
	mov rax, 0
	ret
.end_err:
	add rsp, 8
	leave
	mov rax, -1
	ret


	;; Takes addr, size, and prot as arguments
_set_mem_zone_prot:
	sub rsp, 8

	mov rcx, rsi

	and rcx, 4095
	jz .len_is_pagesize_multiple
	sub rsi, rcx
	add rsi, 4096
.len_is_pagesize_multiple:
	mov rax, SYSCALL(MPROTECT)
	syscall
	add rsp, 8
	neg rax
	ret
