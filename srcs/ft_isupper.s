;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 01:20:19 by sclolus           #+#    #+#              ;
;    Updated: 2018/07/25 18:49:38 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	%define ALPHA_UPPER_LOW_BOUNDARY	0x41
	%define ALPHA_UPPER_HIGH_BOUNDARY	(ALPHA_UPPER_LOW_BOUNDARY + 0x19)

	global	_ft_isupper

	section	.text

_ft_isupper:
	mov	eax, edi
	cmp	eax, ALPHA_UPPER_LOW_BOUNDARY
	jl	.no
	cmp	eax, ALPHA_UPPER_HIGH_BOUNDARY
	jg	.no
	mov	rax, 1
	ret

	.no:
	mov	rax, 0
	ret
