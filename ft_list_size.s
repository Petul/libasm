; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_size.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2025/03/01 20:30:47 by pleander          #+#    #+#              ;
;    Updated: 2025/03/01 20:39:02 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_list_size

;input rdi as t_list*
;return rax as int

ft_list_size:
	mov rax, 0			; init counter

count_loop:
	cmp rdi, 0
	je _exit
	add rax, 1			; increment counter
	mov rdi, [rdi + 8]	; rdi = list->next
	jmp count_loop

_exit:
	ret


