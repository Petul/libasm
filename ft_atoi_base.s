; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/09/23 15:11:28 by pleander          #+#    #+#              ;
;    Updated: 2024/09/27 15:14:21 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_atoi_base
	extern is_base_valid

; input rdi as pointer to string
; input rsi as pointer to base
; output rax as integer
; int ft_atoi_base(char *str, char *base);
ft_atoi_base:
	push rdi
	push rsi
	mov rdi, rsi;
	call is_base_valid
	pop rsi
	pop rdi
	ret
	
