;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/12 04:18:35 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/12 04:31:43 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_isalnum
	extern	_ft_isalpha
	extern	_ft_isdigit
	section	.text

_ft_isalnum:
	push	rbx
	xor		rbx, rbx
	push	rdi
	call	_ft_isalpha
	add		rbx, rax
	pop		rdi
	call	_ft_isdigit
	add		rax, rbx
	test	rax, rax
	jz		.no
	pop		rbx
	ret
	.no:
	xor		rax, rax
	pop		rbx
	ret
