# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: arafeeq <arafeeq@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/03 05:12:57 by arafeeq           #+#    #+#              #
#    Updated: 2023/06/05 04:08:01 by arafeeq          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

all:
	@printf "Launching\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d
	
build:
	@printf "Deploying / Building\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "Stopping\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

clean: down
	@printf "Cleaning images and data in voloumes\n"
	@docker system prune -a
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@printf "Cleaning images, data in voloumes, volumes, and networks\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

re: down
	@printf "Rebuilding\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build