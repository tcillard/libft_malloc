#ifndef LIBFT_MALLOC_H
# define LIBFT_MALLOC_H
# include <unistd.h>
# include <pthread.h>
# include <stdlib.h>
# define TINY   100
# define SMALL  10000

typedef struct s_libft_malloc
{
    void    *tiny;
    void    *small;
    int     tinyActualSize;
    int     smallActualSize;
}             t_libft_malloc;

#endif