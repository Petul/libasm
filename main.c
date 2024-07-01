#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <unistd.h>
#include <sys/errno.h>

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *s1, char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, const void *buf, size_t count);

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

void test_ft_strcmp(void)
{
	char str1[] = "aaa";
	char str2[] = "aaaa";

	printf("strcmp: %d\n", strcmp(str1, str2));
	printf("ft_strcmp: %d\n", ft_strcmp(str1, str2));
	printf("strcmp: %d\n", strcmp(str2, str1));
	printf("ft_strcmp: %d\n", ft_strcmp(str2, str1));

	char str3[] = "Hello";
	char str4[] = "Hello";

	printf("strcmp: %d\n", strcmp(str3, str4));
	printf("ft_strcmp: %d\n", ft_strcmp(str3, str3));
	printf("strcmp: %d\n", strcmp(str4, str3));
	printf("ft_strcmp: %d\n", ft_strcmp(str4, str3));

	printf("strcmp: %d\n", strcmp("", ""));
	printf("ft_strcmp: %d\n", ft_strcmp("", ""));

	printf("strcmp: %d\n", strcmp("","a"));
	printf("ft_strcmp: %d\n", ft_strcmp("", "a"));
	
	printf("strcmp: %d\n", strcmp("a", ""));
	printf("ft_strcmp: %d\n", ft_strcmp("a", ""));
}

void test_ft_write(void)
{
	printf("Return for ft_write: %zi\n", ft_write(1, "Hello World\n", 12));
	printf("Return for write: %zi\n", write(1, "Hello World\n", 12));

	ssize_t ret;
	int ecode;
	ret = ft_write(32, "Hello World\n", 12);
	ecode = errno;
	printf("ft_write ret: %zi, errno: %d\n", ret, ecode);

	ret = write(32, "Hello World\n", 12);
	ecode = errno;
	printf("write ret: %zi, errno: %d\n", ret, ecode);

}

void test_ft_read(void)
{
	char buf[10];

	read(0, buf, 10);
	printf("Read: %s\n", buf);
}

int main(void)
{
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_write();
	test_ft_read();

	return (0);
}
