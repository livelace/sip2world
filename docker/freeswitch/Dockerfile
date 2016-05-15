FROM		ubuntu:14.04.2
MAINTAINER	o.popov@livelace.ru

RUN		apt-get update -y && apt-get install -y libpq-dev libjpeg-dev \
		pkg-config libsqlite3-dev libcurl4-openssl-dev libpcre3-dev libspeex-dev \
		libspeexdsp-dev libldns-dev libedit-dev libasound2-dev libncurses5-dev libtool \
		uuid-dev gsm-utils libgsmme-dev usb-modeswitch-data usb-modeswitch libpt-dev \
		libh323plus-dev javacc openjdk-7-jdk gcj-4.8-jdk ladspa-sdk mono-mcs \
		libmono-2.0-dev libmemcached-dev autoconf libopal-dev libosptk3-dev \
		libgdbm-dev libperl-dev libdb-dev bison portaudio19-dev python-dev \
		libsnmp-dev libvlc-dev libyaml-dev libvpx-dev odbc-postgresql build-essential wget	

WORKDIR		/opt

RUN		wget http://files.freeswitch.org/releases/freeswitch/freeswitch-1.4.18.tar.bz2
RUN		tar xf freeswitch-1.4.18.tar.bz2

WORKDIR		/opt/freeswitch-1.4.18

COPY		modules.conf /opt/freeswitch-1.4.18/modules.conf
COPY		freeswitch-start.sh /freeswitch-start.sh
COPY		odbc.ini /etc/odbc.ini

RUN		./configure --enable-core-pgsql-support --prefix=/opt/freeswitch

WORKDIR		/opt/freeswitch-1.4.18/src/mod/endpoints/mod_gsmopen/libctb-0.16/build

RUN		make DEBUG=0 GPIB=0
RUN		make DEBUG=0 GPIB=0 install
RUN		echo "/usr/local/lib" > /etc/ld.so.conf.d/libctb.conf
RUN		ldconfig

WORKDIR		/opt/freeswitch-1.4.18

RUN		make && make install
RUN		make cd-sounds-install && make cd-moh-install && make uhd-sounds-install && make uhd-moh-install
RUN		make hd-sounds-install && make hd-moh-install && make sounds-install && make moh-install
RUN		rm -Rf /opt/freeswitch-1.4.18

EXPOSE		5060/udp 5061/tcp 8021/tcp 20000-20010/udp

CMD		["/freeswitch-start.sh"]
