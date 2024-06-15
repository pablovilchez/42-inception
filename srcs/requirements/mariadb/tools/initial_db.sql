CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS 'pvilchez'@'%' IDENTIFIED BY '150983';

GRANT ALL PRIVILEGES ON wordpress.* TO 'pvilchez'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '150983';

FLUSH PRIVILEGES;