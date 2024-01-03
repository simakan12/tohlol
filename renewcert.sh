!/bin/bash
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$(cat /root/domain)
alamatemail=$(cat /root/alamatemail)
systemctl stop xray
systemctl stop xray@none
systemctl stop xray@sso
/root/.acme.sh/acme.sh --register-account -m $alamatemail --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl start xray
systemctl start xray@none
systemctl start xray@sso
echo Done
sleep 0.5