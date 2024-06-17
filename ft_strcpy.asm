; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.asm                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/06/17 21:01:52 by pleander          #+#    #+#              ;
;    Updated: 2024/06/17 21:22:08 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_strcpy

; input rdi as pointer to dst string
; input	rsi as pointer to src string
; output rax as pointer to dst string
ft_strcpy:
	mov rcx, rdi ; save original dst pointer
	mov bl, [rsi] ; copy character from src string to bl
	cmp bl, 0 ; check if null in bl
	je _null_exit
_copy_loop:
	mov [rdi], bl
	inc rdi ; increment dst pointer
	inc rsi ; increment src pointer
	mov bl, [rsi] ; copy character from src string to bl
	cmp bl, 0 ; check if null in bl
	jne _copy_loop
_null_exit:
	mov rdi, 0 ; null terminate string
	mov rax, rcx
	ret



