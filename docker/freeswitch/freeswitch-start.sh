#!/bin/bash

fs_bin="/opt/freeswitch/bin/freeswitch"
fs_arg=""

mod_src="/opt/freeswitch/mod"
mod_dst="/mod"

file_fusion_cfg="/opt/freeswitch/scripts/resources/config.lua"

ip_postgres=$(getent hosts postgresql | cut -d ' ' -f 1)

if [ ! "${ip_postgres}" ];then
  ip_postgres="postgresql"
fi 

if [ -d "${mod_dst}" ];then
  # FusionPBX want see modules :)
  cp ${mod_src}/*.so ${mod_dst}/

  # FreeSWITCH doesn't work with /etc/hosts
  sed -i "s/postgresql/${ip_postgres}/g" ${file_fusion_cfg}
  sed -i "s/[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/${ip_postgres}/g" ${file_fusion_cfg}

  ${fs_bin} ${fs_arg} 
else
  echo 'ERROR: docker run -v $(pwd)/data/freeswitch/mod:/mod <image>'
  exit 1
fi
