#!/bin/sh

PGADMIN_CONTAINER=gorani_db_manager
BAKFILE_SAVE_PATH=/var/lib/pgadmin/storage/gorani_gorani.com/sql_files/
TODAY_BAKFILE=$(date +%Y%m%d)_gorani_init.sql
LOCAL_PATH=sql/
RECENT_BAKFILE=recent_gorani_init.sql

docker cp $PGADMIN_CONTAINER:$BAKFILE_SAVE_PATH$TODAY_BAKFILE $LOCAL_PATH

# Move database before dropping.
sed -i '/DROP DATABASE/i \\\connect postgres' $LOCAL_PATH$TODAY_BAKFILE

cp $LOCAL_PATH$TODAY_BAKFILE $LOCAL_PATH$RECENT_BAKFILE

