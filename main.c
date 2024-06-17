#include <stdio.h>
#include <stddef.h>
#include <string.h>

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);

void test_ft_strlen(void)
{
	char *str = "Hello";

	printf("Testing ft_strlen\n");

	printf("ft_strlen(%s)\n", str);
	printf("%s: (%zu)\n", str, ft_strlen(str));

	printf("strlen(%s)\n", str);
	printf("%s: (%zu)\n", str, strlen(str));
}

void test_ft_strcpy(void)
{

	char dst[6];

	printf("Test ft_strcpy\n");

	printf("ft_strcpy\n");
	memset(dst, 0, 6);
	ft_strcpy(dst, "Hello");
	printf("dst contains: %s\n", dst);

	memset(dst, 0, 6);
	printf("strcpy\n");
	strcpy(dst, "Hello");
	printf("dst contains: %s\n", dst);

}

int main(void)
{
	test_ft_strlen();
	test_ft_strcpy();

	return (0);
}
