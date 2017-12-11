;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/10 23:34:31 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/11 00:44:01 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_strdup
	extern	_ft_strlen
	extern	_malloc
	extern	_ft_memcpy

	section	.text

_ft_strdup:
	push	rdi
	call	_ft_strlen				;get string length

	inc		rax 					;add one byte for \0
	mov		rdi, rax
	push	rax
	sub		rsp, 8
	call	_malloc
	add		rsp, 8
	test	rax, rax
	je		.enderr

	pop		rdx
	mov		rdi, rax
	pop		rsi
	call	_ft_memcpy
	ret
.enderr:
	add		rsp, 8
	ret
