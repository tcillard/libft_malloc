#include "libft_malloc.h"
#include <stdio.h>
void *malloc(size_t size)
{
    printf("%lu", size * getpagesize());
    if (size < 0)
        return (NULL);
    return (NULL);
    
}