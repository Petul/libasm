; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/06/30 13:55:32 by pleander          #+#    #+#              ;
;    Updated: 2024/07/01 10:26:45 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
section .text
	global ft_write
	extern __errno_location

; input rdi as target fd
; input rsi as write buffer
; input rdx as number of bytes to write 

ft_write:
	mov rax, 1 ; 1 for write syscall
	syscall
	cmp rax, 0
	jl _error ; check if syscall return error

_end:
	ret

_error:
	mov rdi, rax ; store errno value in rdi
	call __errno_location ; get location of errno
	neg rdi ; flip rdi sign as syscall return errno with negative sign
	mov [rax], rdi ; move errno value to errno location
	mov rax, -1 ; return -1 from write
	jmp _end
