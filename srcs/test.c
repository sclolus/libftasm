/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sclolus <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/11 01:29:54 by sclolus           #+#    #+#             */
/*   Updated: 2018/09/13 09:07:50 by sclolus          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <stdint.h>
#include <string.h>
#include <limits.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <errno.h>
#include <math.h>
#include <sys/mman.h>
#include <assert.h>
//# define BUF_SIZE 4096 * 16 * 16/* * 4096 */

//char	*test = etext;
size_t	ft_strlen(const char *str);

void	nothing(void *rdi, void *rsi);
void	nothing(void *rdi, void *rsi)
{
	(void)rdi;
	(void)rsi;
}


void		*ft_memcpy(void *a, void *b, uint64_t size);
int			ft_puts(const char *s);
char		*ft_strdup(const char *s);
int			ft_isupper(int c);
int			ft_toupper(int c);
int			ft_tolower(int c);
int			ft_isprint(int c);
int			ft_isalpha(int c);
int			ft_islower(int c);
int			ft_isdigit(int c);
int			ft_isalnum(int c);
void		ft_bzero(void *s, size_t n);
char		*ft_strcat(char *s1, const char *s2);
void		ft_cat(int fd);
void		anti_debug(void);
int32_t		trash_text_code(void *addr, uint64_t size);
int32_t		breakpoint_detection(void);

uint64_t	ft_rand(void);
int32_t		replace_text_code(void *dst, uint64_t size, void *src);

uint64_t	factorial(uint64_t n);
uint64_t	factorial(uint64_t n)
{
	uint64_t	i;

	if (n == 0)
		return (1);
	if (n > 20)
		return (0);
	i = n;
	while (i > 1)
	{
		n *= i - 1;
		i--;
	}
	return (n);
}

uint64_t	ipow(uint64_t n, uint64_t exp);
uint64_t	ipow(uint64_t n, uint64_t exp)
{
	uint64_t	i;
	uint64_t	base;

	if (exp == 0)
		return (1);
	i = 1;
	base = n;
	while (i < exp)
	{
		n *= base;
		i++;
	}
	return (n);
}

const static uint64_t	ifac_lookup_table[21] = {
	1UL,
	1UL,
	2UL,
	6UL,
	24UL,
	120UL,
	720UL,
	5040UL,
	40320UL,
	362880UL,
	3628800UL,
	39916800UL,
	479001600UL,
	6227020800UL,
	87178291200UL,
	1307674368000UL,
	20922789888000UL,
	355687428096000UL,
	6402373705728000UL,
	121645100408832000UL,
	2432902008176640000UL,
};

#define COS_ITER 10
double	ft_cos(double x);
double	ft_cos(double x)
{
	uint64_t	fac_iter = 0;
	double		y;

	y = 0;
	while (fac_iter < COS_ITER)
	{
		double pow = exp(fac_iter * 2 * log(x));
		if (fac_iter % 2 == 0)
			y += pow / (double)ifac_lookup_table[fac_iter * 2];
		else
			y -= pow / (double)ifac_lookup_table[fac_iter * 2];
		/* y += (fac_iter % 2 == 0) */
		/* 	? pow(x, fac_iter * 2) / (double)ifac_lookup_table[fac_iter * 2] */
		/* 	: -pow(x, fac_iter * 2) / (double)ifac_lookup_table[fac_iter * 2]; */
		printf("current y = %f, iter: %llu\n", y, fac_iter * 2);
		fac_iter++;
	}
	return (y);
}

static void	fill_random_buf(uint8_t *buf, uint64_t len)
{
	uint64_t	i;

	i = 0;
	while (i < (len & 7) && i < len)
	{
		buf[i] = (uint8_t)ft_rand();
		i++;
	}
	while (i < len)
	{
		*(uint64_t*)(void *)&buf[i] = ft_rand();
		i += 8;
	}
}

#define BUFF_SIZE ((uint64_t)(UINT_MAX))+4325UL
static int	test_memcpy(void)
{
	uint8_t	*buf1 = malloc(BUFF_SIZE);
	uint8_t	*buf1_cpy = malloc(BUFF_SIZE);
	uint8_t	*buf2 = malloc(BUFF_SIZE);
	uint64_t	i;

	i = 0;
	while (i < 10)
	{
		fill_random_buf(buf1, BUFF_SIZE - i);
		fill_random_buf(buf2, BUFF_SIZE - i);
		memcpy(buf1_cpy, buf2, BUFF_SIZE - i);
		assert(buf1 == ft_memcpy(buf1, buf2, BUFF_SIZE - i));
		assert(memcmp(buf1, buf1_cpy, BUFF_SIZE - i) == 0);
		printf("test: %llu checked\n", i);
		i++;
	}
	return (1);
}

//# define TEST_SIZE 1000000
int	main(int argc, char **argv)
{
	(void)argc;
	(void)argv;

/* 	uint64_t	otable[256]; */
/* 	uint64_t	i = 0; */
/* 	ft_bzero(otable, sizeof(otable)); */
/* 	while (i < TEST_SIZE) */
/* 	{ */
/* 		uint64_t tmp = ft_rand(); */
/* //		printf("%llu\n", tmp); */
/* 		otable[tmp]++; */
/* 		i++; */
/* 	} */
/* 	i = (uint64_t)-1; */
/* 	uint64_t	actual_av = 0; */
/* 	while (++i < 256) */
/* 	{ */
/* 		printf("%llu -> %llu\n", i, otable[i]); */
/* 		actual_av += otable[i]; */
/* 	} */
/* 	actual_av /= 256; */
/* 	printf("Expected average number: %llu, actual_av: %llu\n", (uint64_t)TEST_SIZE / 256UL, actual_av); */
	printf("replace returned: %d\n", replace_text_code((void *)&ft_cos, 243, (void *)&factorial));
	uint64_t ret = ((uint64_t (*)(uint64_t))ft_cos)(5);
	printf("ret %llu\n", ret);
	test_div(UINT_MAX + 21348UL);
	assert( puts(NULL) == ft_puts(NULL));
	assert(test_memcpy());
	return (0);
}
