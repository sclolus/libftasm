	global	_ft_memset
	section	.text

_ft_memset:
	mov		r9, rdi
	xor		rax, rax
	xchg	rax, rdx
	mov		rcx, 8
	div		rcx					;get boundary offset
	push	rdx
	push	rax

	xor		rax, rax
	mov		al, sil				;store int c into low byte of rax
	mov		r8, 0x0101010101010101
	imul	r8					;mul magic qword to get int c into every byte of rax
	mov		rcx, qword [rsp + 8];get number of bytes to set one per one to align to page boundary
	cld							; set direction flag to 0, str memory direction is forward
	repnz	stosb
	mov		rcx, qword [rsp]
	repnz	stosq
	mov		rax, r9
	add		rsp, 16
	ret
