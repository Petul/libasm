; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.asm                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/06/25 17:06:48 by pleander          #+#    #+#              ;
;    Updated: 2024/06/25 18:07:31 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_strcmp

; input rdi as pointer to string 1
; input rsi as pointer to string 2
; return	rax > 0: s1 is greater than s2
;			rax < 0: s1 is less than s2
;			rax = 0: s1 is equal to s2
ft_strcmp:
	jmp _cmp
_cmp_loop:
	inc rdi
	inc rsi
	mov rcx, 0 ; initialize register as 0
	mov rdx, 0 ; initialize register as 0
_cmp:
	mov cl, [rdi] ; move s1 character to cl
	mov dl, [rsi] ; move s2 character to dl
	mov r8b, cl
	and r8b, dl ; check if both characters are null
	jz _ret_diff ; return 0 if both are null
	cmp cl, dl ; compare characters
	jz _cmp_loop ; if the characters are equal, continue
_ret_diff:
	mov rax, 0
	mov al, cl
	sub eax, edx ; eax (al) minus edx (dl). We initialized rcx and rdx as 0 previously.

	ret
