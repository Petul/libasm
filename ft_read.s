; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/07/01 19:42:02 by pleander          #+#    #+#              ;
;    Updated: 2024/07/01 19:46:41 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_read
	extern __errno_location

; input rdi as fd to read from
; input rsi as buffer to read to
; input rdx as count of bytes to read
; output rax as number of bytes read or -1 on error

ft_read:
	mov rax, 0 ; 0 for read syscall
	syscall
	cmp rax, 0
	jl _error

_end:
	ret

_error:
	mov rdi, rax ; store errno value in rdi
	call __errno_location ; get location of errno
	neg rdi ; flip rdi sign as syscall return errno with negative sign
	mov [rax], rdi ; move errno value to errno location
	mov rax, -1 ; return -1 from write
	jmp _end
