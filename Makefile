NAME := libasm.a

SFILES := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OFILES := $(SFILES:.s=.o)
NASM := nasm -f elf64 -g -F dwarf

.PHONY: all
all: $(NAME)

$(NAME): $(OFILES)
	ar rcs $(NAME) $?

%.o: %.s
	$(NASM) $< -o $@

.PHONY: clean
clean:
	rm -f $(OFILES)

.PHONY: fclean
fclean: clean
	rm -f $(NAME)

.PHONY: re
re: fclean all
