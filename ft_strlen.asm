section	.text
	global ft_strlen
;input rdi as pointer to string
;output rax as 64 bit integer
ft_strlen:
	mov rbx, 0
_count_loop:
	inc rbx
	inc rdi
	mov cl, [rdi]
	cmp cl, 0
	jne _count_loop

	mov rax, rbx
	ret
