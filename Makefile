NAME := libasm.a

SFILES := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s ft_atoi_base.s is_base_valid.s
OFILES := $(SFILES:.s=.o)
NASM := nasm -f elf64 -g -F dwarf

CFILES := main.c
CFLAGS := -Wall -Wextra --static -g 
# CFLAGS := -Wall -Wextra -Werror --static
CC := gcc #clang?
PROG := prog 

.PHONY: all
all: $(NAME)

$(NAME): $(OFILES)
	ar rcs $(NAME) $?

%.o: %.s
	$(NASM) $< -o $@

$(PROG): $(NAME) $(CFILES)
	$(CC) $(CFILES) $(NAME) $(CFLAGS) -o $(PROG)

.PHONY: clean
clean:
	rm -f $(OFILES)

.PHONY: fclean
fclean: clean
	rm -f $(NAME)
	rm -f $(PROG)

.PHONY: re
re: fclean all
