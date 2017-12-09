#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <stdint.h>

int		ft_isprint(int c);
int		ft_isdigit(int c);
void	*ft_memset(void *b, int c, size_t len);
#pragma GCC diagnostic ignored "-Weverything"
#define BUF_SIZE 4096 * 64 * 2 * 13
#define TEST_VALUE 42
#define TIME_TEST 1
int	main(void)
{
	uint64_t	i;
	static unsigned char 	buf[BUF_SIZE];


	i = 0;
	# if TIME_TEST == 1
	while (i < 4096)
	{
		ft_memset(buf, i, BUF_SIZE);
		i++;
	}
	# endif
	# if TIME_TEST == 0
	uint64_t	u;

	u = 1;
	while (u < 4096)
	{
		i = 0;
		memset(buf, -1, BUF_SIZE);
		if (ft_memset(buf, u, BUF_SIZE) != buf)
		{
			printf("bad return\n");
			return (EXIT_FAILURE);
		}
		while (i < BUF_SIZE)
		{
			if (buf[i] != (unsigned char)u)
			{
				printf("ERROR: KO at %llu:%d\nShould have been: %hhu, is: %hhu", u, i, (unsigned char)u, buf[i]);
				return (EXIT_FAILURE);
			}
			i++;
		}
		u++;
	}
	printf("SUCCESS: OK\n");
	#endif
	return (0);
}
