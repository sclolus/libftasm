;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/12 04:35:31 by sclolus           #+#    #+#              ;
;    Updated: 2018/09/11 13:00:44 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_strcat
	extern	_ft_strlen			;needs strlen
	extern	_ft_memcpy			;needs memset

	section	.text

_ft_strcat:
	push	rdi
	push	rsi
	call	_ft_strlen
	mov		rdi, qword [rsp]	;get s2 that was saved in the stack
	push	rax
	call	_ft_strlen
	pop		rdi
	pop		rsi
	add		rdi, qword[rsp]
	mov		rdx, rax
	inc		rdx
	call	_ft_memcpy
	pop		rax
	ret
