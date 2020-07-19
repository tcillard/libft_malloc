#ifndef LIBFT_MALLOC_H
# define LIBFT_MALLOC_H
# include <unistd.h>
# include <pthread.h>
# include <stdlib.h>
# include <stddef.h>
# define TINY   100
# define SMALL  10000
typedef struct s_libft_malloc
{
    void    *tiny;
    void    *small;
    size_t  tinyActualStorage;
    size_t  smallActualStorage;
}             t_libft_malloc;

#endif