;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isprint.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 02:04:51 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/11 02:05:28 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_isprint

	section	.text

_ft_isprint:
	mov		al, dil
	cmp		rax, 32
	jb		.no
	cmp		rax, 126
	ja		.no
	mov		eax, 1
	ret
.no:
	mov		eax, 0
	ret
