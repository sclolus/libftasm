	global	_ft_memcpy
	section	.text

_ft_memcpy:
	mov		r9, rdi
	xor		rax, rax
	xchg	rax, rdx
	mov		rcx, 8
	div		rcx					;get boundary offset
	push	rdx
	push	rax

	mov		rcx, qword [rsp + 8];get number of bytes to set one per one to align to page boundary
	cld							; set direction flag to 0, str memory direction is forward
	repnz	movsq
	mov		rcx, qword [rsp]
	repnz	movsq
	mov		rax, r9
	add		rsp, 16
	ret
