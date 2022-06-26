#!/bin/sh

docker cp gorani_db_manager:/var/lib/pgadmin/storage/gorani_gorani.com/eer_diagrams/$(date +%Y%m%d)_gorani_diagram.pgerd pgerd/
