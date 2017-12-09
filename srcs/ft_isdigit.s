global	_ft_isdigit
	section	.text

_ft_isdigit:
	cmp	rdi, '0'
	jl	.no
	cmp	rdi, '9'
	ja	.no
	mov	eax, 1
	ret
	.no
	mov	eax, 0
	ret
