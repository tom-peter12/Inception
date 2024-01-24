# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 16:25:24 by tpetros           #+#    #+#              #
#    Updated: 2024/01/25 01:38:11 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Define colors
RESET=\033[0m
BOLD=\033[1m
UNDERLINE=\033[4m
BLINK=\033[5m
INVERSE=\033[7m
BLACK=\033[30m
RED=\033[31m
GREEN=\033[32m
YELLOW=\033[33m
BLUE=\033[34m
MAGENTA=\033[35m
CYAN=\033[36m
WHITE=\033[37m

name = inception

all: build

build:
	@printf "$(BOLD)$(BLUE)Building configuration ${name}...$(RESET)\n"
	@bash srcs/requirements/tools/init_db.sh
	@docker compose -f ./srcs/docker-compose.yml up -d --build

start : 
	@printf "$(BOLD)$(GREEN)Starting existing containers of ${name}...$(RESET)\n"
	@docker compose -f ./srcs/docker-compose.yml start 

stop : 
	@printf "$(BOLD)$(RED)Stopping Running containers of ${name}...$(RESET)\n"
	@docker compose -f ./srcs/docker-compose.yml stop 

up:
	@printf "$(BOLD)$(YELLOW)Restarting configuration ${name}...$(RESET)\n"
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@printf "$(BOLD)$(MAGENTA)Stopping configuration ${name}...$(RESET)\n"
	@docker compose -f ./srcs/docker-compose.yml down

re: fclean build

clean: down
	@printf "$(BOLD)$(WHITE)Cleaning configuration ${name}...$(RESET)\n"
	@docker system prune -a
	-@sudo rm -rf /home/${USER}/data

fclean:
	@printf "$(BOLD)$(INVERSE)$(RED)Total clean of all configurations docker$(RESET)\n"
	-@sudo rm -rf /home/${USER}/data
	-@docker stop $$(docker ps -qa)
	-@docker system prune --all --force --volumes
	-@docker volume rm srcs_wp_data
	-@docker volume rm srcs_db_data
	-@docker network prune --force
	-@docker volume prune --force

.PHONY	: all build down re clean fclean
