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
	push rdi ; save original rdi on stack
	cmp word [rsi], 0 ; check if null in bl
	je _null_exit
_copy_loop:
	mov al, [rsi]
	mov [rdi], al
	inc rdi ; increment dst pointer
	inc rsi ; increment src pointer
	cmp byte [rsi], 0 ; check if null in bl
	jne _copy_loop
_null_exit:
	mov byte [rdi], 0 ; null terminate string
	pop rdi ; pop original dst from stack
	mov rax, rdi
	ret



