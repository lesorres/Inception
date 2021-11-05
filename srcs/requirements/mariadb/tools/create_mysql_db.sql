CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';

-- CREATE DATABASE creates a database with the given name.
-- When the IF NOT EXISTS clause is used, MariaDB will return a warning
-- instead of an error if the specified database already exists.
-- https://mariadb.com/kb/en/create-database/

-- Database privileges priv_type are granted using db_name.* for priv_level,
-- or using just * to use default database. Database privileges include
-- privileges to create tables and functions, as well as privileges
-- for all tables, functions, and procedures in the database.
-- Database privileges are stored in the mysql.db table.
-- https://mariadb.com/kb/en/grant/

-- If the account does not yet exist, then GRANT can implicitly create it.
-- To implicitly create an account with GRANT, a user is required to have
-- the same privileges that would be required to explicitly create the account
-- with the CREATE USER statement.
-- https://mariadb.com/kb/en/grant/

-- The ALL PRIVILEGES privilege grants all available privileges.
-- Granting all privileges only affects the given privilege level. For example,
-- granting all privileges on a table does not grant any privileges on the database or globally.
-- Using ALL PRIVILEGES does not grant the special GRANT OPTION privilege.
-- You can use ALL instead of ALL PRIVILEGES.
-- https://mariadb.com/kb/en/grant/

-- GRANT OPTION - Grant database privileges. You can only grant privileges that you have.
-- https://mariadb.com/kb/en/grant/#database-privileges

-- Use the WITH GRANT OPTION clause to give users the ability to grant privileges
-- to other users at the given privilege level. Users with the GRANT OPTION privilege
-- can only grant privileges they have. They cannot grant privileges at a higher
-- privilege level than they have the GRANT OPTION privilege.
-- https://mariadb.com/kb/en/grant/

-- The FLUSH statement clears or reloads various internal caches used by MariaDB.
-- To execute FLUSH, you must have the RELOAD privilege. See GRANT.
-- FLUSH PRIVILEGES Reload all privileges from the privilege tables in the mysql database.
-- If the server is started with --skip-grant-table option,
-- this will activate the privilege tables again.
-- https://mariadb.com/kb/en/flush/
