section .text

global _ft_rand

_ft_rand:
.until_rand_available:
	rdrand rax
	movzx rax, al
	jnc .until_rand_available
	ret
