; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/07/02 20:13:42 by pleander          #+#    #+#              ;
;    Updated: 2024/07/02 20:27:28 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_strdup
	extern malloc
	extern ft_strlen
	extern ft_strcpy
	extern ft_write

; input rdi as pointer to string to be duplicated
; output rax pointer to duplicated string or NULL if failed
ft_strdup:
	push rdi ; save str on the stack as strlen changes rdi
	call ft_strlen ; calc len of rdi
	add rax, 1 ; add for trailing zero
	mov rdi, rax ; copy malloc argument to input register
	call malloc
	mov rdi, rax ; copy address of heap allocated memory to rdi
	pop rsi ; put input string in rsi
	call ft_strcpy ; copy string from rsi to rdi
	mov rax, rdi ; mov destination addr to return register
	ret
	
