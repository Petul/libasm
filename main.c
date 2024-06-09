#include <stdio.h>
#include <stddef.h>
#include <string.h>

size_t	ft_strlen(char *str);

int main(int argc, char **argv)
{
	if (argc != 2)
		return (0);
	
	printf("Test ft_strlen\n");
	printf("%s: (%zu)\n", argv[1], ft_strlen(argv[1]));
	printf("%s: (%zu)\n", argv[1], strlen(argv[1]));
	
	return (0);
}
