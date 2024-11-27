; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.asm                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/06/17 21:02:07 by pleander          #+#    #+#              ;
;    Updated: 2024/06/25 17:14:09 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section	.text
	global ft_strlen
;input rdi as pointer to string
;output rax as 64 bit integer
ft_strlen:
	push rdi ; save original value of rdi
	mov rax, 0 ; store length counter in rbx
_count_loop:
	mov cl, [rdi] ; copy value of rdi to cl (to get char size)
	cmp cl, 0 ; check if null
	je _ret ; jmp to end if null
	inc rax ; increment counter
	inc rdi ; increment C string pointer
	jmp _count_loop
_ret:
	pop rdi ; restore original value of rdi
	ret
