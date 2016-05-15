#!/bin/bash
#
# Baresip need SRV records or plain IP  

accounts="/opt/baresip-config/accounts"
baresip_bin="/usr/local/bin/baresip"
baresip_arg="-f /opt/baresip-config"
hostname="freeswitch"

getent hosts ${hostname} > /dev/null 2>&1

if [ $? -eq 0 ];then
  ip=$(getent hosts ${hostname} | cut -d ' ' -f1)  
  sed -i "s/IPADDR/${ip}/g" ${accounts}
else
  echo "WARNING: Can't set ip address of Freeswitch for baresip account"
fi

echo 'INFO: docker run --device=/dev/video0:/dev/video0:rwm <image>'

${baresip_bin} ${baresip_arg}
