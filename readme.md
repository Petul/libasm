Practice in Assmebly language

compilation:
    nasm -f elf64 ft_strlen.asm -o ft_strlen.o
    gcc main.c ft_strlen.o
