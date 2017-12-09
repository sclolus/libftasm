	global	_start
	global	_main
	global	ft_bzero

	section	.data
mem:	db '123x'
mem_size:	equ $-mem

	section	.text
_start:
	call	_main
	ret		0
_main:
	mov		rdi, mem
	mov		rsi, mem_size
	call	ft_bzero
	mov		rdi, mem
	ret		0

ft_bzero:
	push	rbp
	mov		rbp, rsp
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
	pop		rbp
	;; mov		rsp, rbp 			;needed ?
	ret
