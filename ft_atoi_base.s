; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/09/23 15:11:28 by pleander          #+#    #+#              ;
;    Updated: 2024/09/23 15:25:08 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_atoi_base
	extern ft_strlen

; input rdi as pointer to string
; input rsi as pointer to base
; output rax as integer
; int ft_atoi_base(char *str, char *base);
ft_atoi_base:
	mov rcx, 0; initialize rcx as letter counter	
	call is_base_valid
	ret
	
is_base_valid:
	push rdi
	push rsi
	mov rdi, rsi
	call ft_strlen
	cmp rax, 2
	jl error_exit
	mov rax, 1
	pop rsi
	pop rdi
	ret

error_exit:
	mov rax, 0
	ret

