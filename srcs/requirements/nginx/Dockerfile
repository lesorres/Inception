# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kmeeseek <kmeeseek@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/04 21:07:50 by kmeeseek          #+#    #+#              #
#    Updated: 2021/10/24 20:38:02 by kmeeseek         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update

# software installation
RUN apt-get install -y nginx
RUN apt-get install -y openssl

# changing configuration files
COPY conf/default /etc/nginx/sites-available/default
RUN sed -ie 's/ssl_protocols TLSv1 TLSv1.1 TLSv1.2;/ssl_protocols TLSv1.2 TLSv1.3;/g' \
	/etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=RU/ST=Russia/L=Kazan/O=21school/OU=21kazan/CN=kmeeseek" -newkey rsa:2048 \
	-keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

# RUN service nginx start; service nginx stop
# CMD nginx -c /etc/nginx/nginx.conf -g "daemon off;"
CMD ["nginx", "-g", "daemon off;"]

# **************************************************************************** #
# updating packages                                                            #
#                                                                              #
# Your copy of Ubuntu has a private copy of the list of packages that are      #
# in Ubuntus repositories. When you install a package, apt-get reads the list  #
# and determines the URL of the package to download (which typically contains  #
# package version information). apt-get update updates the package lists.      #
# If you dont do it before an installation, apt-get might complain that it     #
# cannot find the package in the repository, because it computed the URL based #
# on an old version of the list (which listed an older version of the package).#
# https://askubuntu.com/questions/337198/is-sudo-apt-get-update-mandatory-befor#
# e-every-package-installation                                                 #
#                                                                              #
# apt is for the terminal and gives beautiful output while apt-get             #
# and apt-cache are for scripts and give stable, parsable output               #
# https://askubuntu.com/questions/990823/apt-gives-unstable-cli-interface-warni#
# ng                                                                           #
# **************************************************************************** #
# running nginx                                                                #
#                                                                              #
# In the Dockerfile, the last line specifies the entry point of the image      #
# to be the command: nginx -g daemon off;. This entry point ensures            #
# that NGINX stays in the foreground, so that docker can track the process     #
# properly (otherwise the container will stop immediately after starting)!     #
# https://codeburst.io/get-started-with-nginx-on-docker-907e5c0c9f3a           #
# When a process runs in the foreground, it occupies your shell, and you can   #
# interact with it using the input devices.                                    #
# https://linuxize.com/post/how-to-run-linux-commands-in-background/           #
#                                                                              #
# The CMD instruction is only utilized if there is no argument added           #
# to the run command when starting a container. Therefore, if you add          #
# an argument to the command, you override the CMD.                            #
# https://phoenixnap.com/kb/docker-cmd-vs-entrypoint                           #
# **************************************************************************** #