; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/09/23 15:11:28 by pleander          #+#    #+#              ;
;    Updated: 2024/09/27 16:13:19 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_atoi_base
	extern is_base_valid
	extern ft_write
	extern ft_strlen

%macro write_string 1
	push rax
	push rdi
	push rsi
	push rdx
	mov rdi, %1
	push rdi
	call ft_strlen
	pop rdi
	mov rdx, rax
	mov rsi, %1
	mov rdi, 1
	call ft_write
	mov rdx, 1
	mov rsi, nl
	mov rdi, 1
	call ft_write
	pop rdx
	pop rsi
	pop rdi
	pop rax
%endmacro
	
; input rdi as pointer to number string
; input rsi as pointer to base string
; output rax as integer
; int ft_atoi_base(char *str, char *base);
ft_atoi_base:
	;write_string rdi
	push rdi
	push rsi
	mov rdi, rsi;
	call is_base_valid
	pop rsi
	pop rdi
	cmp rax, 0
	je _calc_error

	push rdi
	push rsi
	mov rdi, rsi
	call ft_strlen ; store base len in rdx
	mov rdx, rax
	pop rsi
	pop rdi

	call _skip_spaces
	call _get_sign

_calc_value:
	mov r9, 0 ; store sum in r9
_calc_loop:
	cmp BYTE [rdi], 0 ; if reached null byte then end
	je _end_calc
	call _get_index_in_base ; find index of numbe rin base
	cmp rax, 0
	jl _calc_error ; did not find index in base
	call _do_calculation
	inc rdi ; go the next character in number string
	jmp _calc_loop
_do_calculation:
	mov r10, rax ; store base index in r10
	push rdx
	push rcx
	mov rax, r9 ; move sum into rax
	mul rdx ; res * ft_strlen(base)
	mov r9, rax ; r9 = res * ft_strlen(base)
	mov rax, r8 ; sign stored in r8
	mul r10 ; rax = sign * base_index
	add r9, rax ; r9 = r9 + rax
	pop rcx
	pop rdx
	ret
_end_calc:
	mov rax, r9
	ret
_calc_error:
	mov rax, -1;
	ret

; returns index in base on rax or -1 if not found
_get_index_in_base:
	push rdi ; save original values
	push rsi
	mov rcx, 0
_get_index_loop: ; TODO: Check get index in base
	mov al, [rsi]
	cmp al, [rdi]
	je _return_index
	cmp BYTE [rsi], 0 ; Reached end of base and did not find character
	je _return_error
	inc rsi
	inc rcx
	jmp _get_index_loop
_return_error:
	mov rax, -1
	pop rsi
	pop rdi
	ret
_return_index:
	mov rax, rcx
	pop rsi
	pop rdi
	ret

_get_sign:
	cmp BYTE [rdi], 45 ; Check if first character is '-'
	je _negative_sign
_positive_sign:
	mov r8, 1
	ret
_negative_sign:
	mov r8, -1
	inc rdi ; Skip first character if it's '-'
	ret

_skip_spaces:
	cmp BYTE [rdi], 32 ; check if first character is space
	jne _skip_spaces_ret
_skip_spaces_loop: ; loop until no more spaces or null
	inc rdi
	cmp BYTE [rdi], 32
	je _skip_spaces_loop
	cmp BYTE [rdi], 0
	je _skip_spaces_loop
_skip_spaces_ret:
	ret

section .data
	nl db 0xa
