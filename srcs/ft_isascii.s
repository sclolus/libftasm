;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 02:06:49 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/11 02:07:37 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
	global	_ft_isascii

	section	.text

_ft_isascii:
	mov		al, dil
	cmp		rax, 0
	jl		.no
	cmp		rax, 127
	jg		.no
	mov		eax, 1
	ret
.no:
	mov		eax, 0
	ret
