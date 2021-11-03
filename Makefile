DCFILE = ./srcs/docker-compose.yaml

all:
# выполняет сборку образов, указанных в параметре build в файле yaml
	docker-compose -f $(DCFILE) build
# запускает контейнеры и создает сеть
	docker-compose -f $(DCFILE) up -d
# **************************************************************************** #
# You can use the -f flag to specify a path to a Compose file                  #
# that is not located in the current directory.                                #
# https://docs.docker.com/compose/reference/                                   #
# без флага -d все контейнеры будут привязаны к текщей терминальной сесии,     #
# соответсвенно как мы из нее выйдем, контейнеры упадут.                       #
# Флаг -d позволяет запускать контейнеры в фоновом режиме                      #
# **************************************************************************** #

up:
	docker-compose ./srcs/docker-compose.yaml up -d

down:
	docker-compose down
	# сначала останавливает все запущенные сервисы, затем удаляет их. также удаляет сеть
clean_all: stop rm_cont rm_network rm_data

stop:
	docker stop $$(docker ps -aq)
rm_cont:
	docker rm $$(docker ps -aq)
rm_network:
	docker network rm srcs_inception_network
ps:
	docker-compose ./srcs/docker-compose.yaml ps
	# показывает контейнеры тех сервисов, которые прописаны в указаном yaml файле

rm_data:
	sudo rm -rf /home/kmeeseek/data/wordpress
	sudo rm -rf /home/kmeeseek/data/database
	mkdir /home/kmeeseek/data/wordpress
	mkdir /home/kmeeseek/data/database

fclean:
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q) 2>/dev/null

nginx:

	docker build ./srcs/requirements/nginx/ --tag nginx
	docker run -it -p 80:80 nginx

# service nginx start
# service nginx status
# service nginx stop
# docker start <container name>
# Use the command docker exec -it <container name> /bin/bash to get a bash shell in the container.

# docker network ls
# docker network inspect

# чтобы проверить версию TLS протокола, ввести внутри nginx контейнера:
#openssl s_client -connect localhost:443
# 