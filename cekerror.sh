#!/bin/bash
#source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /root/domain)
namatoko=$(cat /root/namatoko)
nowa=$(cat /root/nomorwa)
else
domain=$IP
fi
cat /var/log/xray/error.log
