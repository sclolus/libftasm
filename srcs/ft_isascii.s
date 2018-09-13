;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 02:06:49 by sclolus           #+#    #+#              ;
;    Updated: 2018/09/13 09:58:50 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
	global	_ft_isascii

	section	.text

_ft_isascii:
	movsx	rax, edi
	cmp		rax, 0
	jl		.no
	cmp		rax, 127
	jg		.no
	mov		rax, 1
	ret
.no:
	mov		rax, 0
	ret
