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
	mov rax, 0 ; store length counter in rbx
_count_loop:
	inc rax ; increment counter
	inc rdi ; increment C string pointer
	mov cl, [rdi] ; copy value of rdi to cl (to get char size)
	cmp cl, 0 ; check if null
	jne _count_loop

	ret
