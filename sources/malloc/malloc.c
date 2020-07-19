#include "libft_malloc.h"
#include <stdio.h>

t_libft_malloc  getMemoryStorage()
{
    static t_libft_malloc storage;
    return (storage);
}

int             thereIsMemoryStack(size_t size)
{
    t_libft_malloc  storage;

    storage = getMemoryStorage();
    if (size > storage.tinyActualStorage && size > storage.smallActualStorage)
        return (0);
    else
        return (1);
}

void            *getMemory(size_t size)
{
    t_libft_malloc storage;
    (void) size;
    storage = getMemoryStorage();
    return (NULL);
}

void            *malloc(size_t size)
{
    void    *finalMap;

    finalMap = NULL;
    if (size < SMALL)
    {
        if (thereIsMemoryStack(size))
            finalMap = getMemory(size);
        else
        {
          //  addMemory(size);
            finalMap = getMemory(size);
        }
    }
    //else
    //    finalMap = getLargeMemory(size);
    return (finalMap);
}