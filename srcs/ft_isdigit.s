;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/11 02:10:36 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/12 04:22:50 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	_ft_isdigit
	section	.text

_ft_isdigit:
	cmp	edi, '0'
	jb	.no
	cmp	edi, '9'
	ja	.no
	mov	rax, 1
	ret
	.no
	mov	rax, 0
	ret
