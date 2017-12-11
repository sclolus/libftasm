/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sclolus <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/10 15:55:22 by sclolus           #+#    #+#             */
/*   Updated: 2017/12/11 01:28:46 by sclolus          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <stdint.h>
#include <string.h>

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

int	main(void)
{
	char		str[409600];
	char		*dup;
	uint64_t	i = 0;
	while (i < 40960)
	{
		str[i + 1] = 0;
		memset(str, i % 25600, i);
		dup = ft_strdup(str);
		if (strcmp(str, dup))
		{
			nothing(dup, str);
			printf("failure at: %llu\n", i);
			return (EXIT_FAILURE);
		}
//		printf("%llu\n", i);
		free(dup);
		i++;
	}

	return (0);
}
