; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_push_front.s                               :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2025/02/19 19:08:29 by pleander          #+#    #+#              ;
;    Updated: 2025/03/01 20:34:51 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_list_push_front
	extern malloc

;input rdi as t_list**
;input rsi pointer to data of new list

ft_list_push_front:
	cmp rdi, 0		; tlist** == 0
	je _exit

create_elem:
	cmp rsi, 0
	je _exit
	push rsi;		; save data
	push rdi		; save t_list
	mov rdi, 16		; sizeof the struct is 16 bytes
	call malloc
	pop rdi			; restore data
	pop rsi			; restore t_list
	test rax, rax	; test if malloc returned 0
	jz _exit
	mov [rax], rsi	; move data pointer to beginning of structure

add_to_front:
	push rax;		; save pointer to start of new list
	add rax, 8		; move rax to second element of structure
	mov r9, [rdi]
	mov [rax], r9	; set next attribute to previous start
	pop rax;		; restore pointer to start of new list
	mov [rdi], rax	; update pointer to start of list

_exit:
	ret;
