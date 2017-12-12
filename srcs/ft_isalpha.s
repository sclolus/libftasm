;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 01:18:49 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/12 04:31:16 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_isalpha
	extern	_ft_isupper
	extern	_ft_islower
	section	.text

_ft_isalpha:
	push	rbx
	xor		rbx, rbx
	push	rdi
	call	_ft_isupper
	add		rbx, rax
	pop		rdi
	call	_ft_islower
	add		rax, rbx
	test	rax, rax
	jz		.no
	pop		rbx
	ret
	.no:
	xor		rax, rax
	pop		rbx
	ret
