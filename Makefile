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
OBJECTS := $(SOURCES:.c=.o)

SOURCES_PATH = $(addprefix $(SOURCES_DIR)/, $(SOURCES))
OBJECTS_PATH = $(addprefix $(OBJECTS_DIR)/, $(OBJECTS))

$(OBJECTS_DIR)/%.o: $(SOURCES_DIR)/%.c
	@ echo "$(RCURSOR)$(ERASEL)\c"
	@ echo "$(SCURSOR)$(@F) \c"
	@ gcc $(FLAGS) $(INCLUDE_DIR) -c $< -o $@

$(NAME): logo dir $(OBJECTS_PATH)
	@ gcc $(FLAGS) $(INCLUDE_DIR) -shared -o $(NAME).so $(OBJECTS_DIR)/*.o
	@ echo "\n\x1b[32mDONE\x1b[37m"

.PHONY: all clean fclean re

all: $(NAME)

clean:
	@ rm -rf $(OBJECTS_DIR)

fclean: clean
	@ rm -rf $(NAME)

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