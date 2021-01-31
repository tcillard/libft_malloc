#include "libft_malloc.h"
#include <unistd.h>
#include <sys/mman.h>

size_t          convertSizeToPageSize(size_t size) {
    size_t pageSize;

    pageSize = 0;
    while (pageSize < size) {
        pageSize = pageSize + getpagesize();
    }
    return (pageSize / 8);
}

void            *malloc(size_t size)
{
    char    *finalMap;

    finalMap = NULL;
    printf("getpage() = %zu\n",convertSizeToPageSize(size));
    printf("finalMapp adress: %p\n", finalMap);
    finalMap = mmap(NULL, convertSizeToPageSize(size), PROT_EXEC | PROT_READ | PROT_WRITE, MAP_PRIVATE, 0, 0);
    printf("mmap: %p\n", finalMap);
    finalMap[0] = 'a';
    finalMap[1] = 'b';
    finalMap[3] = '\0';
    printf("finalMap address: %p\n", finalMap);
    return (finalMap);
}