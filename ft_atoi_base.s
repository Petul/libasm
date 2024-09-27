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
	pop rsi
	pop rdi
	pop rax
%endmacro
	
; input rdi as pointer to string
; input rsi as pointer to base
; output rax as integer
; int ft_atoi_base(char *str, char *base);
ft_atoi_base:
	write_string rdi
	push rdi
	push rsi
	mov rdi, rsi;
	call is_base_valid
	pop rsi
	pop rdi
	call _skip_spaces
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
