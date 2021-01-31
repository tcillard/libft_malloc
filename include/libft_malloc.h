#ifndef LIBFT_MALLOC_H
# define LIBFT_MALLOC_H
# include <unistd.h>
# include <pthread.h>
# include <stdlib.h>
# include <stddef.h>
# include <stdio.h> //del
# define TINY_LIMIT   100
# define SMALL_LIMIT  10000

typedef struct	s_block
{
	struct s_block 	*next;
	struct s_block	*prev;
	size_t			size;

}				t_block;

typedef struct	t_page
{
    struct s_page	*next;
    struct s_page	*prev;
	void			*alloc;
	void			*free;
	size_t			size;

}				t_page;

typedef struct s_libft_malloc
{
	struct t_page	*tiny;
    struct t_page	*small;
    struct t_block	*large;
}             t_libft_malloc;

void            *malloc(size_t size);
void            free(void *ptr);
void            *realloc(void *ptr, size_t size);
t_libft_malloc  *getMemoryStorage();
#endif