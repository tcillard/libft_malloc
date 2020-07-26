include sources/malloc/malloc.mk
include sources/free/free.mk
include sources/realloc/realloc.mk
include sources/tools/tools.mk

MALLOC_DIR = sources/malloc
REALLOC_DIR = sources/realloc
FREE_DIR = sources/free
TOOLS_DIR = sources/tools

ALL_FILES = $(MALLOC_FILES) $(FREE_FILES) $(REALLOC_FILES) $(TOOLS_FILES)