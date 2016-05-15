FROM		golang	
MAINTAINER	o.popov@livelace.ru

RUN		apt-get update -y && apt-get install -y unzip binutils make gcc 

RUN             mkdir -p /opt/freeswitch/db

COPY		cdr-pusher-master.zip /opt/cdr-pusher-master.zip

WORKDIR		/opt

RUN		unzip cdr-pusher-master.zip	

WORKDIR		/opt/cdr-pusher-master

ENV		GOPATH /opt/cdr-pusher-master

RUN		make build

COPY		cdr-pusher.yaml /etc/cdr-pusher.yaml

CMD		["/opt/cdr-pusher-master/bin/cdr-pusher"]
