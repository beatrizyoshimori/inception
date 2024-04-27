COMPOSE = srcs/docker-compose.yml

all: build up

build:
	sudo chmod a+w /etc/hosts
	sudo cat /etc/hosts | grep byoshimo.42.fr || echo "127.0.0.1 byoshimo.42.fr" >> /etc/hosts
	sudo mkdir -p /home/byoshimo/data/mariadb
	sudo mkdir -p /home/byoshimo/data/wordpress
	docker-compose -f $(COMPOSE) build

up:
	docker-compose -f $(COMPOSE) up -d

down:
	docker-compose -f $(COMPOSE) down

clean:
	docker-compose -f $(COMPOSE) down --rmi all

fclean: clean
	sudo rm -rf /home/byoshimo/data/mariadb
	sudo rm -rf /home/byoshimo/data/wordpress
	docker system prune --all -f

.PHONY: all build up down fclean