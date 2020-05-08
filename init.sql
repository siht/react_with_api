CREATE DATABASE mio CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'my_user'@'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON mio.* TO 'my_user'@'%';
