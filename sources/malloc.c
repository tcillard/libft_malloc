#include "libft_malloc.h"
#include <stdio.h>

t_libft_malloc  getMemoryStorage()
{
      static t_libft_malloc storage;
      return (storage);
}

char            thereIsMemoryStack(size_t size)
{
    t_libft_malloc storage;

    storage = getMemoryStorage();
    if ((!storage.tiny && !storage.small) 
        || (size > storage.tinyActualSize && size > storage.smallActualSize))
        return (0);
    else if (size < storage.tinyActualSize)
        return (1);
    else
        return (2);
}

void            *malloc(size_t size)
{
    void    *finalMap;

    finalMap = NULL;
    if (size >= 0)
    {
        if (thereIsMemoryStack(size))
           finalMap = getMemory(size);
       else
        {
           addMemory(size);
           finalMap = getMemory(size);
        }
        
    }
    return (finalMap);
}