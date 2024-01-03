#!/bin/bash
# // Reading Your Input
read -p "Input Your Domain : " domain
domain=$( echo $domain | sed 's/ //g' );
if [[ $domain == "" ]]; then
    clear;
    echo -e "${ERROR} No Input Detected !";
    exit 1;
fi

# // Input Domain To VPS
echo "$domain" > /root/domain;
domain=$(cat /root/domain);

# // Success
echo -e "${OKEY} Your Domain : $domain";
sleep 2;
clear;
echo "IP=$domain" >> /var/lib/premium-script/ipvps.conf;
source /var/lib/premium-script/ipvps.conf
domain=$(cat /root/domain)
alamatemail=$(cat /root/alamatemail)
systemctl stop xray
systemctl stop xray@none
systemctl stop xray@sso
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt >/dev/null 2>&1
/root/.acme.sh/acme.sh --register-account -m $alamatemail --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl start xray
systemctl start xray@none
systemctl start xray@sso
echo Done
sleep 0.5
