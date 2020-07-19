include sources/malloc/malloc.mk
include sources/free/free.mk
include sources/realloc/realloc.mk
include sources/tools/tools.mk

MALLOC_DIR = sources/malloc
REALLOC_DIR = sources/realloc
FREE_DIR = sources/free
TOOLS_DIR = sources/tools
ALL_SUBDIR = $(MALLOC_DIR) $(REALLOC_DIR) $(FREE_DIR) $(TOOLS_DIR)

SOURCES_MALLOC = $(addprefix $(MALLOC_DIR)/, $(MALLOC_FILES))
SOURCES_FREE = $(addprefix $(FREE_DIR)/, $(FREE_FILES))
SOURCES_REALLOC = $(addprefix $(REALLOC_DIR)/, $(REALLOC_FILES))
SOURCES_TOOLS = $(addprefix $(TOOLS_DIR)/, $(TOOLS_FILES))

ALL_FILES = $(MALLOC_FILES) $(FREE_FILES) $(REALLOC_FILES) $(TOOLS_FILES)
SOURCES = $(SOURCES_MALLOC) $(SOURCES_FREE) $(SOURCES_REALLOC) $(SOURCES_TOOLS)
ALL_DIR = $(MALLOC_DIR) $(TOOLS_DIR) $(FREE_DIR) $(REALLOC_DIR)
