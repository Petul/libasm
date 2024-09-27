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

%macro character_is_valid 1
	cmp %1, 43
	je base_invalid
	cmp %1, 45 
	je base_invalid
	cmp %1, 32
	je base_invalid
%endmacro

; input rdi as pointer to string
; input rsi as pointer to base
; output rax as integer
; int ft_atoi_base(char *str, char *base);
ft_atoi_base:
	mov rcx, 0; initialize rcx as letter counter	
	call is_base_valid
	ret
	
; Checks if the base is valid
is_base_valid:
	push rdi ; save rdi
	push rsi ; save rsi
	mov rdi, rsi ; set move base to rdi for strlen call
	call ft_strlen
	cmp rax, 2 ; check if base is less than 2
	jl base_invalid
	mov rax, 1 ; set valid flag
	mov rdi, rsi ; not necessary?
	character_is_valid BYTE [rsi]

check_one_character:
	inc rdi
	cmp BYTE [rdi], 0;
	je check_next_character ; if we reach null for inner loop, increase outer by one
	mov cl, [rdi]
	mov dl, [rsi]
	cmp cl, dl
	je base_invalid
	jmp check_one_character

check_next_character:
	inc rsi ; increment rsi for next iteration
	cmp BYTE [rsi], 0 ;check if we reached the end of the base string
	je base_return
	character_is_valid BYTE [rsi]
	mov rdi, rsi
	jmp check_one_character ; next iteration of inner loop

base_invalid:
	mov rax, 0 ; set invalid flag

base_return:
	pop rsi; restore rdi
	pop rdi; restore rdi
	ret


