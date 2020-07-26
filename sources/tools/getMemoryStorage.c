#include "libft_malloc.h"

t_libft_malloc  *getMemoryStorage()
{
    static t_libft_malloc storage;
    return (&storage);
}