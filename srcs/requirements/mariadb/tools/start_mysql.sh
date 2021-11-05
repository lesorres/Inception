#!/bin/bash

# editing ports in config
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# starting mysql and creating database if it doesn't exist
if [ ! -d /var/lib/mysql/DB ]
then
service mysql start
apt-get install -y gettext-base
envsubst < /etc//mysql/create_mysql_db.sql | mysql
mysqladmin -u root password $DB_ROOT_PASSWORD
service mysql stop
fi
chown -R mysql:mysql /var/lib/mysql

# running mysql in background
mysqld_safe

# **************************************************************************** #
# sed: s/regexp/replacement/[flags]                                            #
# (substitute) Match the regular-expression against the content of the pattern #
# space. If found, replace matched string with replacement.                    #
# https://www.gnu.org/software/sed/manual/sed.html#sed-script-overview         #
# **************************************************************************** #
# mysqladmin is an administration program for the mysqld daemon. It can be     #
# used to, among other things, change old password to new-password.            #
# The new password can be passed on the commandline as the next argument       #
# (for example, mysqladmin password "new_password", or can be omitted, in which#
# case the user will be prompted for a password.                               #
# https://mariadb.com/kb/en/mysqladmin/                                        #
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
# The normal ownership of everything in /var/lib/mysql is mysql:mysql.         #
# So you should be able to fix it with:                                        #
# sudo chown -R mysql:mysql /var/lib/mysql                                     #
# https://stackoverflow.com/questions/43593736/used-chown-for-var-lib-mysql-to-#
# change-owner-from-root-now-getting-error-1049                                #
# **************************************************************************** #
# about if statement in bash scripts - https://acloudguru.com/blog/engineering/#
# conditions-in-bash-scripting-if-statements                                   #
# **************************************************************************** #