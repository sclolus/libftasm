NAME= test
LIB_NAME=libfts.a
CC=gcc
CC_FLAGS=  -march=native -Werror -v -Weverything  #-g3 -fsanitize=address
ASM_CC= nasm
ARCH_VERSION=10.12
LD= ld
LD_ARCH=x86_64
LD_FLAGS= -arch $(LD_ARCH) -macosx_version_min $(ARCH_VERSION) -execute -lSystem
SRCS=	srcs/ft_strdup.s \
		srcs/ft_puts.s \
		srcs/ft_strlen.s \
		srcs/ft_memcpy.s \
		srcs/ft_memset.s \
		srcs/ft_isdigit.s \
		srcs/ft_isprint.s \
		srcs/ft_strdup.s \
		srcs/ft_isupper.s \
		srcs/ft_islower.s \
		srcs/ft_toupper.s \
		srcs/ft_tolower.s \
		srcs/ft_isascii.s \
		srcs/ft_isalpha.s \
		srcs/ft_isalnum.s \
		srcs/ft_strcat.s \
		srcs/ft_cat.s
OBJS= $(SRCS:.s=.o)
SRCS_C= srcs/test.c
OBJS_C= $(SRCS_C:.c=.o)
#srcs/ft_isalpha.s
ASM_CC_ARCH= macho64
ASM_CC_FLAGS= -f $(ASM_CC_ARCH) -g

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(LIB_NAME) $(OBJS)
#	$(LD) $(LD_FLAGS) $^ -o $@

prod: all $(OBJS_C)
	gcc -L. -lfts $(OBJS_C) -Weverything -Werror -o $(NAME)

%.o: %.s
	$(ASM_CC) $(ASM_CC_FLAGS) $< -o $@
%.o: %.c
	$(CC) $(CC_FLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(OBJS_C)

fclean: clean
	rm -f $(NAME)
re: fclean all

asm: $(OBJ)
	objdump -x86-asm-syntax=intel -disassemble -macho -s -no-show-raw-insn $(OBJS)
h:
	gcc test.c -c -o $(SRCS)
	objdump -x86-asm-syntax=intel -disassemble -macho -s -no-show-raw-insn $(OBJS)
