FROM		ubuntu:14.04.2
MAINTAINER	o.popov@livelace.ru

RUN		apt-get update -y && apt-get install -y build-essential wget libasound2-dev \
		libopencore-amrnb-dev libavcodec-dev libavformat-dev libcairo2-dev \
		libspandsp-dev libgsm1-dev libgstreamer1.0-dev libmpg123-dev libopus-dev \
		oss4-dev libsdl1.2-dev libsdl2-dev libaubio-dev libc6-dev \
		libspeex-dev libspeexdsp-dev libspeexdsp-dev libsrtp0-dev libv4l-dev \
		libx11-dev libvpx-dev libavdevice-dev libswscale-dev

WORKDIR		/opt

RUN		wget http://creytiv.com/pub/baresip-0.4.12.tar.gz
RUN 		wget http://creytiv.com/pub/re-0.4.12.tar.gz
RUN		wget http://creytiv.com/pub/rem-0.4.6.tar.gz

RUN		tar xf re-0.4.12.tar.gz
RUN		tar xf rem-0.4.6.tar.gz
RUN		tar xf baresip-0.4.12.tar.gz

WORKDIR		/opt/re-0.4.12
RUN		make && make install

WORKDIR		/opt/rem-0.4.6
RUN		make && make install

RUN             echo /usr/local/lib > /etc/ld.so.conf.d/re.conf
RUN             ldconfig

WORKDIR		/opt/baresip-0.4.12
RUN		make && make install

RUN		mkdir /opt/baresip-config
COPY		accounts /opt/baresip-config/accounts
COPY		config	/opt/baresip-config/config	
COPY		contacts /opt/baresip-config/contacts

COPY		baresip-start.sh /baresip-start.sh

EXPOSE		1111/udp

CMD		["/baresip-start.sh"]
