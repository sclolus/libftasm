/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sclolus <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/11 01:29:54 by sclolus           #+#    #+#             */
/*   Updated: 2017/12/12 04:14:18 by sclolus          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <stdint.h>
#include <string.h>
#include <limits.h>

//# define BUF_SIZE 4096 * 4096

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

int	main(void)
{
	int32_t	i;

	i = INT_MIN;
	while (i < INT_MAX)
	{
		if (ft_isalpha((int)i) != (isalpha((int)i)))
		{
			printf("Failure at: %d, got: %d, expected: %d\n", i, ft_isalpha((int)i), (isalpha((int)i)));
			return (EXIT_FAILURE);
		}
		i++;
	}
	printf("SUCCES: OK\n");
	return (0);
}
