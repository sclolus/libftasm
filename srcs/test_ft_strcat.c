/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sclolus <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/11 01:29:54 by sclolus           #+#    #+#             */
/*   Updated: 2018/09/11 12:57:37 by sclolus          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <stdint.h>
#include <string.h>
#include <limits.h>

# define BUF_SIZE 4096 * 16 * 16/* * 4096 */

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
char	*ft_strcat(char *s1, const char *s2);

int	main(void)
{
	static char	dst[BUF_SIZE];
	static char	src[BUF_SIZE];
	static char	bin_res[BUF_SIZE];


	uint32_t	i;

	i = 0;
	while (i < BUF_SIZE - 1)
	{
		memset(dst, 42, i / 2);
		dst[ i / 2 + 1] = 0;
		memset(bin_res, 42, i / 2);
		bin_res[ i / 2 + 1] = 0;
		memset(src, 65, i / 2);
		char *my_return  = ft_strcat(dst, src);
		char *his_return = strcat(bin_res, src);
//		nothing(bin_res, dst);
		if (strcmp(bin_res, dst) || my_return != dst)
		{
			printf("Failure: ret: %p his: %p\n", my_return, his_return);
			return (EXIT_FAILURE);
		}
		i++;
	}
	return (0);
}
