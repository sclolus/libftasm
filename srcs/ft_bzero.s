;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/12 01:13:43 by sclolus           #+#    #+#              ;
;    Updated: 2017/12/12 05:35:26 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	global	ft_bzero

ft_bzero:
	and		rsi, rsi
	je		.end
	xor		rdx, rdx
	.loop:
	xor		rcx, rcx
	mov		[rdi], rcx
	add		rdi, 1
	add		rdx, 1
	cmp		rdx, rsi
	jne		.loop
	.end:
	ret
