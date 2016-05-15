FROM		ubuntu:14.04.2
MAINTAINER	o.popov@livelace.ru

RUN		apt-get update -y && apt-get install -y apache2=2.4.7-1ubuntu4.4 apache2-bin=2.4.7-1ubuntu4.4 \
		apache2-data=2.4.7-1ubuntu4.4  php5 php5-mongo php5-mysql php5-pgsql php5-sqlite nmap

RUN		ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf
RUN		ln -s /etc/apache2/mods-available/ssl.conf /etc/apache2/mods-enabled/ssl.conf
RUN		ln -s /etc/apache2/mods-available/ssl.load /etc/apache2/mods-enabled/ssl.load
RUN		ln -s /etc/apache2/mods-available/socache_shmcb.load /etc/apache2/mods-enabled/socache_shmcb.load

RUN		sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php5/apache2/php.ini
RUN		sed -i "s/max_input_time = 60/max_input_time = 300/g" /etc/php5/apache2/php.ini

RUN		mkdir /opt/freeswitch

ENV 		APACHE_CONFDIR /etc/apache2
ENV             APACHE_RUN_USER www-data
ENV             APACHE_RUN_GROUP www-data
ENV             APACHE_LOG_DIR /var/log/apache2

RUN 		find "$APACHE_CONFDIR" -type f -exec sed -ri ' \
		s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
    		s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
		' '{}' ';'


EXPOSE          80/tcp 443/tcp

CMD		["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
