;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/09/13 09:59:33 by sclolus           #+#    #+#              ;
;    Updated: 2018/09/13 10:05:26 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

extern _ft_strlen
extern _ft_memcpy
section	.text
global	_ft_strcpy

_ft_strcpy:
	push rbp
	mov rbp, rsp

	push rdi
	push rsi

	xchg rdi, rsi
	call _ft_strlen

	inc rax
	mov rdi, qword [rbp - 8]
	mov rsi, qword [rbp - 16]
	mov rdx, rax
	call _ft_memcpy

	add rsp, 16
	leave
	ret
