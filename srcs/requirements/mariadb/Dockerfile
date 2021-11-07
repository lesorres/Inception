# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kmeeseek <kmeeseek@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/11 23:26:34 by kmeeseek          #+#    #+#              #
#    Updated: 2021/11/07 19:05:54 by kmeeseek         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# updating packages
RUN apt-get update

# software installation
RUN apt-get install -y mariadb-server

# copying mysql client commands
COPY /tools/create_mysql_db.sql /etc/mysql/
COPY /tools/start_mysql.sh /

CMD bash start_mysql.sh

# **************************************************************************** #
# apt is for the terminal and gives beautiful output while apt-get             #
# and apt-cache are for scripts and give stable, parsable output               #
# https://askubuntu.com/questions/990823/apt-gives-unstable-cli-interface-warni#
# ng                                                                           #
# **************************************************************************** #