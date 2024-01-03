#!/bin/bash
#source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /root/domain)
namatoko=$(cat /root/namatoko)
nowa=$(cat /root/nomorwa)
else
domain=$IP
fi
clear
cektrf
cektrf-none