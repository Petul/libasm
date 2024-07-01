NAME := libasm.a

SFILES := ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s
OFILES := $(SFILES:.s=.o)
NASM := nasm -f elf64

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
