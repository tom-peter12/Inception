# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 16:25:24 by tpetros           #+#    #+#              #
#    Updated: 2024/01/18 15:24:05 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

name = inception

all: build

build:
	@printf "Building configuration ${name}...\n"
	@bash srcs/requirements/tools/init_db.sh
	@docker compose -f ./srcs/docker-compose.yml up -d --build

start : 
	@printf "Starting  existing containers of ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml start 

stop : 
	@printf "Stoping Running containers of ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml stop 

up:
	@printf "restarting configuration ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@printf "Stopping configuration ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml down

re: fclean build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	-@sudo rm -rf /home/${USER}/data

fclean:
	@printf "Total clean of all configurations docker\n"
	-@sudo rm -rf /home/${USER}/data
	-@docker stop $$(docker ps -qa)
	-@docker system prune --all --force --volumes
	-@docker volume rm srcs_wp_data
	-@docker volume rm srcs_db_data
	-@docker network prune --force
	-@docker volume prune --force

.PHONY	: all build down re clean fclean