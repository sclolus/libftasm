/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sclolus <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/11 01:29:54 by sclolus           #+#    #+#             */
/*   Updated: 2018/09/11 13:00:22 by sclolus          ###   ########.fr       */
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
//# define BUF_SIZE 4096 * 16 * 16/* * 4096 */

//char	*test = etext;
size_t	ft_strlen(const char *str);

void	nothing(void *rdi, void *rsi);
void	nothing(void *rdi, void *rsi)
{
	(void)rdi;
	(void)rsi;
}

int	ft_puts(const char *s);
char	*ft_strdup(const char *s);
int		ft_isupper(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_isprint(int c);
int		ft_isalpha(int c);
int		ft_islower(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
void	ft_bzero(void *s, size_t n);
char	*ft_strcat(char *s1, const char *s2);
void	ft_cat(int fd);
void	ft_execve(char *path, char **argv);
void	anti_debug(void);
void	trash_text_code(void *addr, uint64_t size);
int32_t	breakpoint_detection(void);

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

int	main(int argc, char **argv)
{
	(void)argc;
	(void)argv;
//	anti_debug();
//	trash_text_code((void *)ft_cos, 4096);
//	breakpoint_detection();
//	anti_debug();
//	ft_cos(12.2);

	char *str1 = strdup("2");
	char *str2 = strdup("This is a string");

	char *ret = ft_strcat(str1, str2);
	(void)ret;
	printf("%s\n", ret);
	return (0);
}
