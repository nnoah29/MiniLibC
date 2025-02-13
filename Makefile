
NAME = libstrlen.so
OBJ = *.o

all: $(NAME)

$(NAME):
	nasm -f elf64 memcpy.asm
	nasm -f elf64 memmove.asm
	nasm -f elf64 memset.asm
	nasm -f elf64 strcasecmp.asm
	nasm -f elf64 strchr.asm
	nasm -f elf64 strcmp.asm
	nasm -f elf64 strcspn.asm
	nasm -f elf64 strlen.asm
	nasm -f elf64 strncmp.asm
	nasm -f elf64 strpbrk.asm
	nasm -f elf64 strrchr.asm
	nasm -f elf64 strstr.asm
	ld -shared -o $(NAME) $(OBJ)

clean:
	rm -f *.o
	rm -rf a.out
	rm -rf .log

fclean: clean
	rm -f $(NAME)

re: fclean all