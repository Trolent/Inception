# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: trolland <trolland@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/06/14 16:46:02 by trolland          #+#    #+#              #
#    Updated: 2025/06/14 16:57:23 by trolland         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = docker compose
COMPOSE_CONF = ./src/docker-compose.yml
WP_PATH = ./src/requirements/wordpress
MDB_PATH = ./src/requirements/mariadb

all: up

up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_CONF) up 

down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_CONF) down --volumes --remove-orphans

clean: down
	docker image rm -f $(shell docker image ls -aq)
	docker container rm -f $(shell docker container ls -aq)