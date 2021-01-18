#!/bin/sh

if [ `id -u` -eq 0 ]
then
  echo "Install rflink2mqtt..."
  cp rflink2mqtt.init /etc/init.d/rflink2mqtt
  chmod +x /etc/init.d/rflink2mqtt

  cp rflink2mqtt.ini /etc/default/rflink2mqtt.ini

  mkdir /usr/local/libexec
  cp rflink2mqtt.py /usr/local/libexec/rflink2mqtt.py
  chmod +x /usr/local/libexec/rflink2mqtt.py

  update-rc.d rflink2mqtt defaults && invoke-rc.d rflink2mqtt start  
  
  echo "rflink2mqtt installed."
else
  echo "You need to be ROOT (sudo can be used)"
fi

