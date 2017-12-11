;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_toupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 01:52:18 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/11 01:54:39 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
	global	_ft_toupper
	extern	_ft_islower
	section	.text

_ft_toupper:
	call	_ft_islower
	test	rax, rax
	jz		.unchanged
	mov		rax, rdi
	sub		rax, 0x20
	ret
	.unchanged:
	mov	rax, rdi
	ret
