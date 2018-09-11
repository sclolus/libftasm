%define TSC_DELTA 70000
extern _printf
section	.data
tsc_format:  db 'eax value: %u', 10, 0
tsc_diff_format: db 'tsc diff: %u', 10, 0

	global	_anti_debug

section	.text

; _start:
; 	call	_main
; 	ret

_anti_debug:
	push	rbp
	mov		rbp, rsp


	rdtsc

	lea		rdi, [rel tsc_format]
	xor		esi, esi
	mov		esi, eax

	push	rax
	rdtsc
	push	rax

	mov		al, 0
	call	_printf
	pop	rax
	pop rdi

	sub rax, rdi
	push rax
	push rax

	lea	rdi, [rel tsc_diff_format]
	mov rsi, rax
	call _printf

	pop rax
	pop rax
	cmp rax, TSC_DELTA
	ja	.abort

.end:
	pop		rbp
	ret

.abort:
	push rax
	ret
