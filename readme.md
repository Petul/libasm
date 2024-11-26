# libasm (Work in progress)
Libasm is an introductory project to x86_64 Assembly and is a project of the 42 networks specialization cursus. The task is to write a set of functions in x86_64 Linux ASM for the NASM Assembler and create a library, `libasm.a`, which can be included and compiled with C-programs. A simple C-program along with a Makefile is provided to test the functions.

Note: The project is not finished and may not work as expected in all situations.

## Functions

### ft_strlen
`size_t ft_strlen(char *str)`

ft_strlen calculates and returns the length or `str`.

### ft_strcpy
`char	*ft_strcpy(char *dst, char *src)`

ft_strcpy copies the string pointed to by `src` into the the location pointed to by `dst`.

### ft_strcmp
`int		ft_strcmp(char *s1, char *s2)`

ft_strcmp compares the strings `s1` and `s2`. It returns:
* 0 if the strings are equal
* a negative number if `s1` is less than `s2`
* a positive number is `s2` is greater than `s1`

### ft_write
`ssize_t	ft_write(int fd, const void *buf, size_t count)`

ft_write wraps around the `write` syscall and prints `count` characters from `buf` to the file represented by `fd`. It returns the number of bytes written or -1 if an error occurred.

### ft_read
`ssize_t	ft_read(int fd, const void *buf, size_t count)`

ft_read wraps arount the `read` syscall and reads `count` characters to the `buf` from the file represented by `fd`. It returns the number of bytes read or -1 if an error occurred.

### ft_strdup
`char	*ft_strdup(const char *s)`

ft_strdup creates a duplicate of `s`. It dynamically allocates memory. It returns a pointer the the duplicate or NULL if an error occurred.

### ft_atoi_base
`int		ft_atoi_base(char *str, char *base)`

ft_atoi_base takes an array of characters and a base, which the characters are part of and prints the number as a decimal integer.

Example:
```C
ft_atoi_base("0", "0123456789") // returns 0
ft_atoi_base("42", "0123456789") // returns 42
ft_atoi_base("ff", "0123456789abcdef") // returns 255
ft_atoi_base("101010", "01") // returns 42
```

## Build

Build the library using the provided Makefile:
```bash
make
```

Build the test program with the included main:
```
make prog
```

## Run
After building, run with 
```
./prog
```
