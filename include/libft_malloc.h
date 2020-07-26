#ifndef LIBFT_MALLOC_H
# define LIBFT_MALLOC_H
# include <unistd.h>
# include <pthread.h>
# include <stdlib.h>
# include <stddef.h>
# include <stdio.h> //del
# define TINY   100
# define SMALL  10000
typedef struct s_libft_malloc
{
    void    *tiny;
    void    *small;
    size_t  tinyAvailableSize;
    size_t  smallAvailableSize;
}             t_libft_malloc;

void            *malloc(size_t size);
void            free(void *ptr);
void            *realloc(void *ptr, size_t size);
t_libft_malloc  *getMemoryStorage();
#endif