; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_list_sort.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: pleander <pleander@student.hive.fi>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2025/03/01 20:59:28 by pleander          #+#    #+#              ;
;    Updated: 2025/03/03 08:54:08 by pleander         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global ft_list_sort
	extern ft_write


;input rdi as t_list **begin_list
;input rsi as int (*cmp)()
ft_list_sort:
	call is_sorted
	cmp rax, 0
	je	_print_not_sorted
	jmp _print_sorted
	
_print_sorted:
	mov rdi, 1
	mov rsi, sorted_msg
	mov rdx, 7
	call ft_write
	jmp _exit

_print_not_sorted:
	mov rdi, 1
	mov rsi, not_sorted_msg
	mov rdx, 11
	call ft_write
	jmp _exit

;input rdi as t_list **begin_list
;input rsi as int (*cmp)()
is_sorted:
	push rdi
	push rsi
	push r8
	mov r8, [rdi]			; store	t_list* TODO: check if null
	mov r9, rsi				; store f in r9
_is_sorted_loop:
	mov rdi, [r8]			; save current char* in rdi
	mov rsi, [r8 + 8]		; save next char** in rsi
	cmp rsi, 0				; check if current is last element
	jz _is_sorted_true
	mov rsi, [rsi]
	push r8
	push r9
	call r9
	pop r9
	pop r8
	mov r8, [r8 + 8]
	cmp eax, 0				; (*cmp)() returns int, so only compare 4 bytes i.e. eax
	jg _is_sorted_false		; list is not sorted
	jmp _is_sorted_loop

_is_sorted_false:
	mov rax, 0;
	jmp _is_sorted_exit;

_is_sorted_true:
	mov rax, 1
	jmp _is_sorted_exit;
	
_is_sorted_exit:
	pop r8
	pop rsi
	pop rdi
	ret;

_exit:
	ret

section .data
	sorted_msg db 'Sorted', 0xa
	not_sorted_msg db 'Not sorted', 0xa
