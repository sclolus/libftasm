/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sclolus <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/09 08:07:38 by sclolus           #+#    #+#             */
/*   Updated: 2017/12/09 08:41:15 by sclolus          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <stdint.h>
#include <string.h>

#define BUF_SIZE 40960000
#define TIME_TEST 1
void	*ft_memcpy(void *dst, const void *src, size_t n);

int	main(void)
{
	uint64_t	i;
	static unsigned char	src[BUF_SIZE];
	static unsigned char	buf[BUF_SIZE];
#if TIME_TEST == 0
	static unsigned char	bin_buf[BUF_SIZE];
	#endif

	i = 0;
	#if TIME_TEST == 1
	while (i < 4096)
	{
		ft_memcpy(buf, src, BUF_SIZE);
		i++;
	}
	#endif
	#if TIME_TEST == 0
	while (i < 4096)
	{
		memset(src, i, BUF_SIZE);
		memcpy(bin_buf, src, BUF_SIZE);
		ft_memcpy(buf, src, BUF_SIZE);
		if (memcmp(bin_buf, buf, BUF_SIZE))
		{
			printf("Failure at test: %llu\n", i);
			return (EXIT_FAILURE);
		}
		i++;
	}
	printf("Success: OK\n");
	#endif
	return (0);
}
