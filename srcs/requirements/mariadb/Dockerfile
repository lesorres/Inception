# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kmeeseek <kmeeseek@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/11 23:26:34 by kmeeseek          #+#    #+#              #
#    Updated: 2021/10/20 22:47:27 by kmeeseek         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# **************************************************************************** #
# apt is for the terminal and gives beautiful output while apt-get             #
# and apt-cache are for scripts and give stable, parsable output               #
# https://askubuntu.com/questions/990823/apt-gives-unstable-cli-interface-warni#
# ng                                                                           #
# **************************************************************************** #

# updating packages
RUN apt-get update

# software installation
RUN apt-get install -y mariadb-server

# replacing configuration files
# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN cat conf/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cnf

# **************************************************************************** #
# s/regexp/replacement/[flags]                                                 #
# (substitute) Match the regular-expression against the content of the pattern #
# space. If found, replace matched string with replacement.                    #
# https://www.gnu.org/software/sed/manual/sed.html#sed-script-overview         #
# **************************************************************************** #

RUN sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -ie 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# **************************************************************************** #
# This will set the owner of the file to mysql and the permissions 600         #
# will give only the user mysql access to read and write to the file,          #
# it will disallow access to all other users.                                  #
# https://stackoverflow.com/questions/32133353/unable-to-connect-to-mysql-datab#
# ase-in-ubuntu                                                                #
# **************************************************************************** #

# RUN chown mysql:mysql /etc/mysql/mariadb.conf.d/50-server.cnf; \
# 	chmod 600 /etc/mysql/mariadb.conf.d/50-server.cnf

# copying mysql client commands
COPY tools/create_mysql_db.sql /etc/mysql/

# starting mysql and creating database
RUN service mysql start && mysql < /etc//mysql/create_mysql_db.sql
RUN rm -rf /etc//mysql/create_mysql_db.sql

# running mysql in background
# **************************************************************************** #
# "mysqld" is MySQL server daemon program which runs quietly in background     #
# on your computer system. Invoking "mysqld" will start the MySQL server       #
# on your system.                                                              #
# http://dba.fyicenter.com/faq/mysql/What-Is-MySQL-Server-Daemon-mysqld.html   #
# **************************************************************************** #
CMD service mysql stop && mysqld