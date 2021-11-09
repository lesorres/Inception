DCFILE = ./srcs/docker-compose.yaml

all:
	docker-compose -f $(DCFILE) build
	docker-compose -f $(DCFILE) up -d

fclean: stop rm_cont rm_volumes rm_network rm_images rm_data

stop:
	- docker stop $$(docker ps -qa)
rm_cont:
	- docker rm $$(docker ps -qa)
rm_volumes:
	- docker volume rm $$(docker volume ls -q)
rm_network:
	- docker network rm $$(docker network ls -q) 2>/dev/null
rm_images:
	- docker rmi -f $$(docker images -qa)
rm_data:
	sudo rm -rf /home/kmeeseek/data/wordpress
	sudo rm -rf /home/kmeeseek/data/database
	mkdir /home/kmeeseek/data/wordpress
	mkdir /home/kmeeseek/data/database

up:
	docker-compose ./srcs/docker-compose.yaml up -d
down:
	docker-compose down
ps:
	docker-compose ./srcs/docker-compose.yaml ps
# **************************************************************************** #
# docker-compose -f $(DCFILE) build:                                           #
# выполняет сборку образов, указанных в параметре build в файле yaml           #
# docker-compose -f $(DCFILE) up -d:                                           #
# запускает контейнеры и создает сеть                                          #
# docker-compose down:                                                         #
# сначала останавливает все запущенные сервисы, затем удаляет их. также удаляет#
# сеть                                                                         #
# docker-compose ./srcs/docker-compose.yaml ps                                 #
# показывает контейнеры тех сервисов, которые прописаны в указаном yaml файле  #
# **************************************************************************** #
# You can use the -f flag to specify a path to a Compose file                  #
# that is not located in the current directory.                                #
# https://docs.docker.com/compose/reference/                                   #
# без флага -d все контейнеры будут привязаны к текщей терминальной сесии,     #
# соответсвенно как мы из нее выйдем, контейнеры упадут.                       #
# Флаг -d позволяет запускать контейнеры в фоновом режиме                      #
# **************************************************************************** #
# чтобы проверить версию TLS протокола, ввести внутри nginx контейнера:        #
# openssl s_client -connect localhost:443                                      #
# **************************************************************************** #
# Use the command docker exec -it <container name> /bin/bash to get a bash     #
# shell in the container.                                                      #
# **************************************************************************** #
# для игнорирования ошибок при выполнении makefie использованть минус перед    #
# командой или запускать makefile с флагом -i                                  #
# https://www.ibm.com/docs/ru/aix/7.1?topic=file-preventing-make-command-from-s#
# topping-errors                                                               #
# https://stackoverflow.com/questions/3143635/how-to-ignore-mv-error           #
# **************************************************************************** #
# usefull commands:                                                            #
# service nginx start                                                          #
# service nginx status                                                         #
# service nginx stop                                                           #
# docker start <container name>                                                #
# docker network ls                                                            #
# docker network inspect                                                       #
# **************************************************************************** #