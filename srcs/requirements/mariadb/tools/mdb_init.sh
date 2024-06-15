#!/bin/bash

  sed -i "s/MDB_DB_NAME/${MDB_DB_NAME}/g" /var/www/initial_db.sql
  sed -i "s/MDB_USER_NAME/${MDB_USER_NAME}/g" /var/www/initial_db.sql
  sed -i "s/MDB_USER_PASS/${MDB_USER_PASS}/g" /var/www/initial_db.sql
  sed -i "s/MDB_ROOT_PASS/${MDB_ROOT_PASS}/g" /var/www/initial_db.sql

  chmod 644 /var/www/initial_db.sql

  mysqld --init-file=/var/www/initial_db.sql