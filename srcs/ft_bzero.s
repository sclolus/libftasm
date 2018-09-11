;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: sclolus <marvin@42.fr>                     +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/12 01:13:43 by sclolus           #+#    #+#              ;
;    Updated: 2018/09/10 09:22:59 by sclolus          ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	extern _ft_memset
	section .text
	global	_ft_bzero

_ft_bzero:	mov rdx, rsi
	mov rsi, 0
	call _ft_memset
	ret
