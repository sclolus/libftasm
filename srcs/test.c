/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sclolus <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/11 01:29:54 by sclolus           #+#    #+#             */
/*   Updated: 2017/12/12 07:38:01 by sclolus          ###   ########.fr       */
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

//# define BUF_SIZE 4096 * 16 * 16/* * 4096 */

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
void	ft_cat(int fd);

int	main(int argc, char **argv)
{
	int	fd;

	(void)argc;
	(void)argv;
	(void)fd;
	if (argc == 2)
	{
		if (-1 == (fd = open(argv[1], O_RDONLY)))
		{
			perror(NULL);
			return (EXIT_FAILURE);
		}
		nothing(NULL, NULL);
//		read(999, &fd, 1);
		ft_cat(fd);
	}
	return (0);
}
