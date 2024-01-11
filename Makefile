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

all:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@docker system prune -a
	-@sudo rm -rf /root/data

fclean:
	-docker stop $$(docker ps -qa)
	-docker system prune --all --force --volumes
	-docker network prune --force
	-docker volume prune --force
	-@sudo rm -rf /root/data

.PHONY	: all build down re clean fclean
