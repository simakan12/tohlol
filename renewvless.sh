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
NUMBER_OF_CLIENTS=$(grep -c -E "^### Vless" "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                clear
                echo ""
                echo "You have no existing clients!"
                exit 1
        fi

        clear
        echo ""
        echo "Select the existing client you want to renew"
        echo " Press CTRL+C to return"
        echo -e "==============================="
        grep -E "^### Vless" "/etc/xray/config.json" | cut -d ' ' -f 3-4 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
read -p "Expired (days): " masaaktif
user=$(grep -E "^### Vless " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### Vless " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### Vless $user $exp/### Vless $user $exp4/g" /etc/xray/config.json
sed -i "s/### Vless $user $exp/### Vless $user $exp4/g" /etc/xray/none.json
clear
echo ""
echo " Akun berhasil diperpanjang"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " =========================="
