; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    is_base_valid.s                                    :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/09/27 15:10:55 by pleander          #+#    #+#              ;
;    Updated: 2024/09/27 15:19:41 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global is_base_valid
	extern ft_strlen

%macro character_is_valid 1
	cmp %1, 43
	je _base_invalid
	cmp %1, 45 
	je _base_invalid
	cmp %1, 32
	je _base_invalid
%endmacro

; input rdi as pointer to base
; output rax, 1 if valid 0 if invalid
; Checks if the base is valid
is_base_valid:
	call ft_strlen
	cmp rax, 2 ; check if base is less than 2
	jl _base_invalid
	mov rax, 1 ; set valid flag
	mov rdi, rsi ; not necessary?
	character_is_valid BYTE [rsi]

_check_one_character:
	inc rdi
	cmp BYTE [rdi], 0;
	je _check_next_character ; if we reach null for inner loop, increase outer by one
	mov cl, [rdi]
	mov dl, [rsi]
	cmp cl, dl
	je _base_invalid
	jmp _check_one_character

_check_next_character:
	inc rsi ; increment rsi for next iteration
	cmp BYTE [rsi], 0 ; check if we reached the end of the base string
	je _base_return
	character_is_valid BYTE [rsi]
	mov rdi, rsi
	jmp _check_one_character ; next iteration of inner loop

_base_invalid:
	mov rax, 0 ; set invalid flag

_base_return:
	ret
