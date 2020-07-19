include sources/sources.mk

SCURSOR = \033[s
RCURSOR = \033[u
ERASEL = \033[K

ifeq (${HOSTTYPE},)
	NAME := libft_malloc_$(shell uname -m)_$(shell uname -s)
else
	NAME := libft_malloc_${HOSTTYPE}
endif

FLAGS = -Wall -Wextra -Werror -I

SOURCES_DIR = ./sources
OBJECTS_DIR = ./objects
INCLUDE_DIR = ./include
OBJECTS_MALLOC := $(SOURCES_MALLOC:.c=.o)
OBJECTS_REALLOC := $(SOURCES_REALLOC:.c=.o)
OBJECTS_TOOLS := $(SOURCES_TOOLS:.c=.o)
OBJECTS_FREE := $(SOURCES_FREE:.c=.o)
OBJECT_FILES = $(ALL_FILES:.c=.o)

OBJECTS_PATH =	$(addprefix $(OBJECTS_DIR)/, $(OBJECT_FILES))
	

$(OBJECT_DIR)/%.o: $(ALL_SUBDIR)/%.c
	@ echo "$(RCURSOR)$(ERASEL)\c"
	@ echo "$(SCURSOR)$(@F) \c"
	@ gcc $(FLAGS) $(INCLUDE_DIR) -c $< -o $@


$(NAME): logo dir $(OBJECTS_PATH)
	# @ gcc $(FLAGS) $(INCLUDE_DIR) -shared -o $(NAME).so $(OBJECTS)/*.o
	# @ ln -sf $(NAME).so libft_malloc.so
	# @ echo "\n\x1b[32mDONE\x1b[37m"

.PHONY: all clean fclean re

all: $(NAME)

clean:
	@ rm -rf $(OBJECTS_DIR)

fclean: clean
	@ rm -rf $(NAME).so
	@ rm -rf libft_malloc.so

print: $(MALLOC_OBJECTS_DIR)
	@ echo "ALL_FILES = $(ALL_FILES)\n"
	@ echo "OBJECTS = $(OBJECTS)\n"
	@ echo "OBJECTS_DIR = $(OBJECTS_DIR)\n"
	@ echo "MALLOC_DIR = $(MALLOC_DIR)\n"
	@ echo "MALLOC_OBJECTS_DIR = $(MALLOC_OBJECTS_DIR)\n"
	@ echo "OBJECTS_PATH = $(OBJECTS_PATH)\n"
	@ echo "SOURCES_MALLOC = $(SOURCES_MALLOC)\n"
	@ echo "SOURCES_FREE = $(SOURCES_FREE)\n"
	@ echo "SOURCES_REALLOC= $(SOURCES_REALLOC)\n"
	@ echo "SOURCES_FREE = $(SOURCES_FREE)\n"
	@ echo "FREE_OBJECTS_DIR = $(FREE_OBJECTS_DIR)\n"
	@ echo "OBJECT_FILES = $(OBJECT_FILES)\n"
	@ echo "ALL_SUBDIR = $(ALL_SUBDIR)\n"

re: fclean all

dir:
	@ mkdir -p $(OBJECTS_DIR)

logo:
	@ echo "\x1b[31m"
	@ echo " _  _  _       __  _                              _  _              "
	@ echo "| |(_)| |     / _|| |                            | || |             "
	@ echo "| | _ | |__  | |_ | |_          _ __ ___    __ _ | || |  ___    ___ "
	@ echo "| || || '_ \ |  _|| __|        | '_ \` _ \  / _\` || || | / _ \  / __|"
	@ echo "| || || |_) || |  | |_         | | | | | || (_| || || || (_) || (__ "
	@ echo "|_||_||_.__/ |_|   \__|        |_| |_| |_| \__,_||_||_| \___/  \___|"
	@ echo "                        ______                                      "
	@ echo "                       |______|                                     "
	@ echo "\x1b[37m$(SCURSOR)"