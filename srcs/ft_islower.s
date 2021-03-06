;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_islower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 01:49:35 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/12 03:09:35 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	%define ALPHA_LOWER_LOW_BOUNDARY	0x61
	%define ALPHA_LOWER_HIGH_BOUNDARY	(ALPHA_LOWER_LOW_BOUNDARY + 0x19)

	global	_ft_islower

	section	.text

_ft_islower:
	mov	eax, edi
	cmp	eax, ALPHA_LOWER_LOW_BOUNDARY
	jl	.no
	cmp	eax, ALPHA_LOWER_HIGH_BOUNDARY
	jg	.no
	mov	rax, 1
	ret

	.no:
	mov	rax, 0
	ret
