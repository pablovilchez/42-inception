FROM debian:bullseye

RUN apt-get update -y && apt-get install -y tini mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools /var/www/

RUN if [ ! -f /var/www/initial_db.sql ]; then \
        echo "ERROR: initial_db.sql FILE not found."; \
        exit 1; \
    fi

RUN mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["mysqld"]