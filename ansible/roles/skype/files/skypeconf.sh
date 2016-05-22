#!/bin/bash

sh_file="/opt/freeswitch/skypopen/skype-clients-startup-dir/start_skype_clients.sh"
xml_file="/opt/freeswitch/etc/freeswitch/autoload_configs/skypopen.conf.xml"

sh_file_bak="${sh_file}.bak"
xml_file_bak="${xml_file}.bak"

if [ ! -f "$sh_file" ] || [ ! -f "$xml_file" ];then
  echo "ERROR: Some configuration files aren't found"
  exit 1
fi

if [ ! -f "$sh_file_bak" ];then
  cp $sh_file $sh_file_bak
fi

if [ ! -f "$xml_file_bak" ];then
  cp $xml_file $xml_file_bak
fi

if [ "$1" = "reset" ];then
  if [ -f "$sh_file_bak" ] && [ -f "$xml_file_bak" ];then
    cp $sh_file_bak $sh_file
    cp $xml_file_bak $xml_file
    echo "INFO: Reset happened"
    exit 0
  else
    echo "ERROR: Reset has not occurred"
    exit 1
  fi
fi

echo -n "Enter your Skype name and press [ENTER]: "
read username

echo -n "Enter your Skype password and press [ENTER]: "
read -s password

if [ "$username" != "" ] && [ "$password" != "" ];then

  echo "INFO: Set username and password in Skype startup script"
  sed -i "s|username|${username}|g" $sh_file
  sed -i "s|password|${password}|g" $sh_file

  echo "INFO: Set username in module configuration"
  sed -i "s|username|${username}|g" $xml_file

  echo "INFO: Skype startup script: ${sh_file}"
  echo "INFO: Module configuration: ${xml_file}"
  echo "INFO: You should restart skype client. See /etc/rc.local or just reboot"
  echo "INFO: You can reset configuration with $0 reset"

else
  echo -e "\nERROR: Configuration did not set. Check your input"
  exit 1
fi
