FROM		ubuntu:14.04.2
MAINTAINER	o.popov@livelace.ru

ENV		POSTGRES_VERSION 9.4

RUN		apt-get update -y && apt-get install -y wget
RUN		echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list
RUN		wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN		apt-get update -y && apt-get install -y postgresql=9.4+169.pgdg14.04+1 \
		postgresql-client=9.4+169.pgdg14.04+1 postgresql-client-common=169.pgdg14.04+1 \
		postgresql-common=169.pgdg14.04+1 postgresql-contrib=9.4+169.pgdg14.04+1

RUN		echo "listen_addresses = '*'" >> /etc/postgresql/9.4/main/postgresql.conf
RUN		echo "host all freeswitch 0.0.0.0/0 trust" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN             echo "host all fusionpbx 0.0.0.0/0 trust" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN		echo "host all cdrstats3 0.0.0.0/0 trust" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN		echo "host all admin 0.0.0.0/0 trust" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN		rm -rf /var/lib/postgresql

RUN		mkdir -p /var/run/postgresql/$POSTGRES_VERSION-main.pg_stat_tmp
RUN		chown postgres /var/run/postgresql/$POSTGRES_VERSION-main.pg_stat_tmp
RUN		chgrp postgres /var/run/postgresql/$POSTGRES_VERSION-main.pg_stat_tmp

COPY		postgres-start.sh /postgres-start.sh

EXPOSE		5432/tcp

USER		postgres
CMD 		["/postgres-start.sh"]
