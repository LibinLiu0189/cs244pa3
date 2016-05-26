#! /bin/bash

if [ $# -lt 1 ]; then 
  echo "Enter qdisc "
  exit;
fi
qdisc=$1

set -x
sudo tunctl -t tap0
sudo ifconfig tap0 10.0.0.2 netmask 255.255.255.0 up
sudo ifconfig tap0 mtu 1420
sudo $SPROUT_BT2 $qdisc eth0 00:19:b9:73:4d:f9 # binds to eth0 and tap0
