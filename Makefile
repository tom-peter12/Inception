# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tpetros <tpetros@student.42abudhabi.ae>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/03 16:25:24 by tpetros           #+#    #+#              #
#    Updated: 2024/01/05 18:11:03 by tpetros          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

name = inception
# # 
# all:
# 	@bash srcs/requirements/tools/init_db.sh
# 	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

# build:
# 	@bash srcs/requirements/tools/init_db.sh
# 	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

# down:
# 	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

# re: down
# 	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

# clean: down
# 	@docker system prune -a
# 	-@sudo rm -rf /home/$(USER)/data

# fclean:
# 	-docker stop $$(docker ps -qa)
# 	-docker system prune --all --force --volumes
# 	-docker network prune --force
# 	-docker volume prune --force
# 	-docker builder prune
# 	-@sudo rm -rf /home/$(USER)/data

# .PHONY	: all build down re clean fclean


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
	-@sudo rm -rf /home/tomas/data

fclean:
	@printf "Total clean of all configurations docker\n"
	-@sudo rm -rf /home/tomas/data
	-@docker stop $$(docker ps -qa)
	-@docker system prune --all --force --volumes
	-@docker network prune --force
	-@docker volume prune --force

.PHONY	: all build down re clean fclean