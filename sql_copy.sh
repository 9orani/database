#!bin/bash

docker cp gorani_db_manager:/var/lib/pgadmin/storage/gorani_gorani.com/$(date +%Y%m%d)_gorani_init.sql ./sql_files/
cp sql_files/$(date +%Y%m%d)_gorani_init.sql sql_files/recent_gorani_init.sql

