;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/12 05:58:09 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/12 07:40:52 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;


	%define SYSCALL(n) (0x2000000 | n)
	%define WRITE 4
	%define READ 3
	%define STDOUT 1
	%define STDERR 2
	%define BUF_SIZE 8192

	global	_ft_cat

	section	.data
err_bad_read_str:	db 'ft_cat: fd: Bad file descriptor', 10
err_bad_read_str_len:	equ $-err_bad_read_str
err_bad_write_str:	 db 'ft_cat: stdout: Bad file descriptor', 10
err_bad_write_str_len:	equ $-err_bad_write_str

	section	.bss
buffer:	resb	BUF_SIZE


	section	.text

_ft_cat:
	push	rdi					;push fd on stack

.loop:

	mov		rax, SYSCALL(READ) 	;read on fd
	mov		edi, dword [rsp]
	lea		rsi, [rel buffer]
	mov		rdx, BUF_SIZE
	clc
	syscall
	jb		.err_bad_read
	cmp		rax, 0
	jle		.exit

	mov		rdx, rax			;write buffer on STDOUT
	mov		rax, SYSCALL(WRITE)
	mov		rdi, STDOUT
	lea		rsi, [rel buffer]
	syscall
	jb		.err_bad_write

	jmp		.loop

.exit:
	add		rsp, 8
	ret
.err_bad_read:
 	;; Error handling on bad read fd
	mov		rax, SYSCALL(WRITE)
	mov		rdi, STDERR
	lea		rsi, [rel err_bad_read_str]
	mov		rdx, err_bad_read_str_len
	syscall
	add		rsp, 8
	ret
.err_bad_write:
		;; Error handling on bad stdout
	mov		rax, SYSCALL(WRITE)
	mov		rdi, STDERR
	lea		rsi, [rel err_bad_write_str]
	mov		rdx, err_bad_write_str_len
	syscall
	add		rsp, 8
	ret
