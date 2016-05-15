#!/bin/bash
#
# PostgreSQL need database :)

pg_bin="/usr/lib/postgresql/9.4/bin/postgres"
pg_arg="-D /var/lib/postgresql/9.4/main -c config_file=/etc/postgresql/9.4/main/postgresql.conf"

pg_db="/var/lib/postgresql"

if [ -d "${pg_db}" ];then
  find ${pg_db} -type f -iname ".gitkeep" -exec rm -f {} \;
  ${pg_bin} ${pg_arg}
else
  echo 'ERROR: docker run -v $(pwd)/data/postgresql:/var/lib/postgresql <image>'
  exit 1
fi
