;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 01:57:27 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/11 01:58:01 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_tolower
	extern	_ft_isupper
	section	.text

_ft_tolower:
	call	_ft_isupper
	test	rax, rax
	jz		.unchanged
	mov		rax, rdi
	add		rax, 0x20
	ret
	.unchanged:
	mov	rax, rdi
	ret
