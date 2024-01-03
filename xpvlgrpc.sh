#!/bin/bash
data=( `cat /etc/xray/config.json | grep '^### Vlgrpc' | cut -d ' ' -f 3`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### Vlgrpc $user" "/etc/xray/config.json" | cut -d ' ' -f 4)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### Vlgrpc $user $exp/,/^}/d" /etc/xray/config.json
fi
done