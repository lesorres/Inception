#!/bin/bash

# editing ports in config
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# starting mysql and creating database
if [ ! -d /var/lib/mysql/DB ]
then
service mysql start
apt-get install -y gettext-base
envsubst < /etc//mysql/create_mysql_db.sql | mysql
# rm -rf /etc//mysql/create_mysql_db.sql;
# running mysql in background
mysqladmin -u root password $DB_ROOT_PASSWORD
service mysql stop
fi

chown -R mysql:mysql /var/lib/mysql
mysqld_safe

# **************************************************************************** #
# s/regexp/replacement/[flags]                                                 #
# (substitute) Match the regular-expression against the content of the pattern #
# space. If found, replace matched string with replacement.                    #
# https://www.gnu.org/software/sed/manual/sed.html#sed-script-overview         #
# **************************************************************************** #
# "mysqld" is MySQL server daemon program which runs quietly in background     #
# on your computer system. Invoking "mysqld" will start the MySQL server       #
# on your system.                                                              #
# http://dba.fyicenter.com/faq/mysql/What-Is-MySQL-Server-Daemon-mysqld.html   #
# **************************************************************************** #
# This will set the owner of the file to mysql and the permissions 600         #
# will give only the user mysql access to read and write to the file,          #
# it will disallow access to all other users.                                  #
# https://stackoverflow.com/questions/32133353/unable-to-connect-to-mysql-datab#
# ase-in-ubuntu                                                                #
# **************************************************************************** #
# about if statement in bash scripts - https://acloudguru.com/blog/engineering/#
# conditions-in-bash-scripting-if-statements                                   #
# **************************************************************************** #