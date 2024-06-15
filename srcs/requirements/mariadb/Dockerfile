FROM debian:bullseye

RUN apt-get update -y && apt-get install -y tini mariadb-server

EXPOSE 3306

RUN mkdir -p /run/mysqld/ && chown -R mysql:mysql /run/mysqld/

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mdb_init.sh /
COPY ./tools/initial_db.sql /var/www/

RUN chmod +x /mdb_init.sh

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["bash", "mdb_init.sh"]
