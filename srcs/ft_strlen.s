;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/09 08:47:58 by sclolus           #+#    #+#              ;
;    Updated: 2018/07/25 18:50:19 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	%define MAGIC (0x7efefefefefefeff)
	%define TESTER ~MAGIC
	%define LO		0x0101010101010101
	%define HI		0x8080808080808080

	global	_ft_strlen

	section	.text

_ft_strlen:
	mov		r9, rdi				;save orignal arg adress

	mov		rcx, rdi
	and		rcx, 0x7			;get offset from qword boundary
	je		.loop
	xor		rax, rax
	cld
	repnz	scasb
	je		.end
.loop:
	mov		rax, qword[rdi]
	add		rdi, 8
	mov		rsi, LO
	sub		rax, rsi
	mov		rsi, HI
	and		rax, rsi
	je		.loop
	sub		rdi, 8
	mov		rcx, 8
	xor		rax, rax
	repnz	scasb
	mov		al, byte [rdi - 1]
	test	al, al
	jnz		.loop
.end:
	dec		rdi
	xchg	rax, rdi
	sub		rax, r9
	ret
