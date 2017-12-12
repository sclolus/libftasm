;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/12 05:58:09 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/12 06:23:09 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;


	%define SYSCALL(n) (0x2000000 | n)
	%define WRITE 4
	%define READ 3
	%define STDOUT 1
	%define BUF_SIZE 8192

	global	_ft_cat

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
	syscall
	cmp		rax, 0
	jle		.exit

	mov		rdx, rax			;write buffer on STDOUT
	mov		rax, SYSCALL(WRITE)
	mov		rdi, STDOUT
	lea		rsi, [rel buffer]
	syscall
	cmp		rax, 0
	jl		.exit
	jmp		.loop

.exit:
	pop		rdi
	ret
