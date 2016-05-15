#!/bin/bash

if [ ! "$1" ];then
  echo "ERROR: Select operation: build/remove"
  exit 1
fi

if [ "$1" == "build" ];then
  docker build -t livelace/sip2world-apache:2.4.7 apache/  
  docker build -t livelace/sip2world-baresip:0.4.12 baresip/
  docker build -t livelace/sip2world-cdr-stats:3.0.0 cdr-stats3/
  docker build -t livelace/sip2world-cdr-stats-pusher:3.0.0 cdr-stats3-pusher/
  docker build -t livelace/sip2world-cdr-stats-djcelery:3.0.0 cdr-stats3-djcelery/
  docker build -t livelace/sip2world-cdr-stats-djcelerybeat:3.0.0 cdr-stats3-djcelerybeat/
  docker build -t livelace/sip2world-freeswitch:1.4.18 freeswitch/
  docker build -t livelace/sip2world-postgresql:9.4 postgresql/
elif [ "$1" == "remove" ];then
  docker rmi -f livelace/sip2world-apache:2.4.7
  docker rmi -f livelace/sip2world-baresip:0.4.12
  docker rmi -f livelace/sip2world-cdr-stats:3.0.0
  docker rmi -f livelace/sip2world-cdr-stats-pusher:3.0.0
  docker rmi -f livelace/sip2world-cdr-stats-djcelery:3.0.0
  docker rmi -f livelace/sip2world-cdr-stats-djcelerybeat:3.0.0
  docker rmi -f livelace/sip2world-freeswitch:1.4.18
  docker rmi -f livelace/sip2world-postgresql:9.4
elif [ "$1" == "clean" ];then
  docker images | awk '{ if ($1 == "<none>") print $3 }' | xargs docker rmi -f
  docker ps -a | awk '{print $1}' | xargs docker rm -f
fi
