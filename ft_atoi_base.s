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

; input rdi as pointer to string
; input rsi as pointer to base
; output rax as integer
; int ft_atoi_base(char *str, char *base);
ft_atoi_base:
	mov rcx, 0; initialize rcx as letter counter	

