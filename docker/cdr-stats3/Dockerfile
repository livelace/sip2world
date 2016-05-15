FROM		ubuntu:14.04.2
MAINTAINER	o.popov@livelace.ru

RUN		apt-get update -y && apt-get install -y unzip wget python-setuptools git python-dev \
		libpq-dev mercurial libgraphviz-dev pkg-config build-essential npm nodejs nodejs-legacy vim

RUN             locale-gen en_US.UTF-8
ENV             LC_ALL en_US.UTF-8
ENV             LANG en_US.UTF-8
ENV		C_FORCE_ROOT true

RUN             mkdir -p /opt/freeswitch/db
RUN             mkdir /var/log/cdr-stats

COPY		cdr-stats-develop.zip	/opt/cdr-stats-develop.zip

WORKDIR         /opt

RUN		unzip cdr-stats-develop.zip 
RUN		mkdir -p /opt/cdr-stats-develop/cdr_stats/components/components

COPY		bowerrc /root/.bowerrc
COPY		settings.py /opt/cdr-stats-develop/cdr_stats/cdr_stats/settings.py
COPY            settings_local.py /opt/cdr-stats-develop/cdr_stats/cdr_stats/settings_local.py

WORKDIR         /opt/cdr-stats-develop

RUN		sed -i "s/#pandas==/pandas==/g" install/requirements/*.txt
RUN		easy_install pip
RUN		pip install -r install/requirements/all-requirements.txt 
RUN		npm install -g bower
RUN		ln -s /usr/local/bin/bower /usr/bin/bower

WORKDIR		/opt/cdr-stats-develop/cdr_stats

RUN		python manage.py bower_install
RUN		python manage.py collectstatic --noinput

RUN             sed -i "s/host='localhost'/host='redis'/g" /usr/local/lib/python2.7/dist-packages/redis/client.py
RUN             sed -i "s/\/usr\/local\/freeswitch/\/opt\/freeswitch/" /opt/cdr-stats-develop/cdr_stats/realtime/tasks.py

EXPOSE		8000/tcp

CMD		["python", "/opt/cdr-stats-develop/cdr_stats/manage.py", "runserver", "0.0.0.0:8000"]
