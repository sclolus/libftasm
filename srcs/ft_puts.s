;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/10 21:06:49 by sclolus           #+#    #+#              ;
;    Updated: 2018/09/11 08:39:03 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	default rel
	%define SYSCALL(n) (0x2000000 | n)
	%define WRITE 4
	%define STDOUT 1
	%define EOF -1 				;dafuq is going on with the standard


	section		.data
NULL_STR:	db '(null)', 0
NEWLINE:	db	10

	global	_ft_puts
	extern 	_ft_strlen 			;need extern symbol _ft_strlen
	section	.text

_ft_puts:
	lea		r10, [rel NULL_STR]
	cmp		rdi, 0				;When you hope that NULL ptr is defined as 0...
	cmovz	rdi, r10
	mov		r10, rdi
	call	_ft_strlen

	mov		rdx, rax
	mov		rax, SYSCALL(WRITE)
	mov		rdi, STDOUT
	mov		rsi, r10
	syscall
	jb		.error

	mov		rax, SYSCALL(WRITE)
	mov		rdi, STDOUT
	lea		rsi, [rel NEWLINE]
	mov		rdx, 1 				;len of buffer (LOL)
	syscall
	jb		.error

	mov		rax, 10
	ret
	.error:
	mov		rax, EOF
	ret
