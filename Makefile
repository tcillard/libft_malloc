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

OBJECTS_DIR = ./objects
MALLOC_OBJECTS_DIR = $(OBJECTS_DIR)
REALLOC_OBJECTS_DIR = $(OBJECTS_DIR)
FREE_OBJECTS_DIR = $(OBJECTS_DIR)
TOOLS_OBJECTS_DIR = $(OBJECTS_DIR)

INCLUDE_DIR = ./include
MALLOC_OBJECTS_FILES = $(MALLOC_FILES:.c=.o)
FREE_OBJECTS_FILES = $(FREE_FILES:.c=.o)
REALLOC_OBJECTS_FILES = $(REALLOC_FILES:.c=.o)
TOOLS_OBJECTS_FILES = $(TOOLS_FILES:.c=.o)
OBJECTS_FILES = $(ALL_FILES:.c=.o)
OBJECTS_PATH = $(addprefix $(OBJECTS_DIR)/, $(OBJECTS_FILES))

MALLOC_OBJECTS_PATH =	$(addprefix $(MALLOC_OBJECTS_DIR)/, $(MALLOC_OBJECTS_FILES))
FREE_OBJECTS_PATH =	$(addprefix $(REALLOC_OBJECTS_DIR)/, $(REALLOC_OBJECTS_FILES))
REALLOC_OBJECTS_PATH =	$(addprefix $(FREE_OBJECTS_DIR)/, $(FREE_OBJECTS_FILES))
TOOLS_OBJECTS_PATH =	$(addprefix $(TOOLS_OBJECTS_DIR)/, $(TOOLS_OBJECTS_FILES))


$(MALLOC_OBJECTS_DIR)/%.o: $(MALLOC_DIR)/%.c
	@ echo "$(RCURSOR)$(ERASEL)\c"
	@ echo "$(SCURSOR)$(@F) \c"
	@ gcc $(FLAGS) $(INCLUDE_DIR) -c $< -o $@
$(REALLOC_OBJECTS_DIR)/%.o: $(REALLOC_DIR)/%.c
	@ echo "$(RCURSOR)$(ERASEL)\c"
	@ echo "$(SCURSOR)$(@F) \c"
	@ gcc $(FLAGS) $(INCLUDE_DIR) -c $< -o $@
$(FREE_OBJECTS_DIR)/%.o: $(FREE_DIR)/%.c
	@ echo "$(RCURSOR)$(ERASEL)\c"
	@ echo "$(SCURSOR)$(@F) \c"
	@ gcc $(FLAGS) $(INCLUDE_DIR) -c $< -o $@
$(TOOLS_OBJECTS_DIR)/%.o: $(TOOLS_DIR)/%.c
	@ echo "$(RCURSOR)$(ERASEL)\c"
	@ echo "$(SCURSOR)$(@F) \c"
	@ gcc $(FLAGS) $(INCLUDE_DIR) -c $< -o $@


$(NAME): logo dir $(MALLOC_OBJECTS_PATH) $(FREE_OBJECTS_PATH) $(REALLOC_OBJECTS_PATH) $(TOOLS_OBJECTS_PATH)
	@ gcc $(FLAGS) $(INCLUDE_DIR) -shared -o $(NAME).so $(OBJECTS_PATH)
	@ ln -sf $(NAME).so libft_malloc.so
	@ echo "\n\x1b[32mDONE\x1b[37m"
 
.PHONY: all clean fclean re

all: $(NAME)

clean:
	@ rm -rf $(OBJECTS_DIR)

fclean: clean
	@ rm -rf $(NAME).so
	@ rm -rf libft_malloc.so

print: $(MALLOC_OBJECTS_DIR)
	@ echo "ALL_FILES = $(OBJECTS_FILES)\n"
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