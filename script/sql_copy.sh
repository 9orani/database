#!bin/bash

docker cp gorani_db_manager:/var/lib/pgadmin/storage/gorani_gorani.com/sql_files/$(date +%Y%m%d)_gorani_init.sql sql/
cp sql/$(date +%Y%m%d)_gorani_init.sql sql/recent_gorani_init.sql

