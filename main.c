#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <sys/errno.h>
#include <stdlib.h>
#include <fcntl.h>
#include <assert.h>

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *s1, char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, const void *buf, size_t count);
char	*ft_strdup(const char *s);
int		ft_atoi_base(char *str, char *base);

#define PRINT_OK "\x1B[32mOK\n\x1B[m"
#define PRINT_ERR "\x1B[31mERROR\n\x1B[m"

void test_ft_strlen(void)
{
	puts("Testing ft_strlen..\n");

	assert(ft_strlen("Hello") == strlen("Hello"));
	assert(ft_strlen("") == strlen(""));
	assert(ft_strlen("A") == strlen("B"));

	puts("ft_strlen: OK");
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
	puts("Testing ft_read..");
	char *str = "Hello Read!\n";
	char *buf = calloc(sizeof(char), strlen(str) + 1);
	char *buf2 = calloc(sizeof(char), strlen(str) + 1);
	int fd = open("read_test", O_CREAT | O_WRONLY | O_TRUNC, 0644);
	write(fd, str, strlen(str));
	close(fd);
	fd = open("read_test",  O_RDONLY);
	ssize_t r_ft = ft_read(fd, buf, strlen(str));
	close(fd);

	fd = open("read_test",  O_RDONLY);
	ssize_t r_c = read(fd, buf2, strlen(str));
	close(fd);

	assert(r_ft > 0);
	assert(r_ft == r_c);
	assert(strcmp(buf, buf2) == 0);

	free(buf);
	free(buf2);

	puts("ft_read: OK");
}

void test_ft_strdup(void)
{

	{
		printf("Testing ft_strdup(\"hello\")\n");
		char *dup;
		dup = ft_strdup("hello");
		if (!dup)
			printf("ft_strdup returned null\n");
		else
		{
			printf("ft_strdup: %s\n", dup);
			free(dup);
		}
	}
	{
		printf("Testing strdup(\"hello\")\n");
		char *dup;
		dup = strdup("hello");
		if (!dup)
			printf("strdup returned null\n");
		else
		{
			printf("strdup: %s\n", dup);
			free(dup);
		}
	}
	{
		printf("Testing ft_strdup(\"\")\n");
		char *dup;
		dup = ft_strdup("");
		if (!dup)
			printf("ft_strdup returned null\n");
		else
		{
			printf("ft_strdup: %s\n", dup);
			free(dup);
		}
	}
	{
		printf("Testing strdup(\"\")\n");
		char *dup;
		dup = strdup("");
		if (!dup)
			printf("strdup returned null\n");
		else
		{
			printf("strdup: %s\n", dup);
			free(dup);
		}
	}

}

#define TEST_FT_ATOI_BASE(num, base, res) { \
	printf(" Checking ft_atoi_base( %10s, %20s ) == %5d ", num, base ,res); \
	ft_atoi_base(num, base) == res ? printf(PRINT_OK) : printf(PRINT_ERR); \
}

void test_ft_atoi_base(void)
{
	puts("Testing ft_atoi_base..");

	TEST_FT_ATOI_BASE("0", "0123456789", 0);
	TEST_FT_ATOI_BASE("-42", "0123456789", -42);
	TEST_FT_ATOI_BASE("42", "0123456789", 42);
	TEST_FT_ATOI_BASE("101010", "01", 42);
	TEST_FT_ATOI_BASE("-2a", "0123456789abcdef", -42);
	TEST_FT_ATOI_BASE("0", "0", -1); //invalid base
	TEST_FT_ATOI_BASE("12", "01231456", -1); //invalid base
	TEST_FT_ATOI_BASE("ff", "0123456789abcdef", 255);
}

int main(void)
{
	//test_ft_strlen();
	// test_ft_strcpy();
	// test_ft_strcmp();
	// test_ft_write();
	// test_ft_read();
	test_ft_strdup();
//	test_ft_atoi_base();

	return (0);
}
