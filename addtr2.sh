#!/bin/bash
#source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /root/domain)
namatoko=$(cat /root/namatoko)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                read -rp "User: " -e user
                read -rp "Password: " -e pass
                CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

                if [[ ${CLIENT_EXISTS} == '1' ]]; then
                        echo ""
                        echo "A client with the specified name was already created, please choose another name."
                        exit 1
                fi
        done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojan$/a\### '"Trojan $user $exp"'\
},{"password": "'""$pass""'","flow": "'"xtls-rprx-direct"'","email": "'""trojantcp-$user""'"' /etc/xray/config.json
sed -i '/#ws$/a\### '"WS $user $exp"'\
},{"password": "'""$pass""'","email": "'""trojanws-$user""'"' /etc/xray/config.json
sed -i '/#trgrpc$/a\### '"Trgrpc $user $exp"'\
},{"password": "'""$pass""'","email": "'""trojangrpc-$user""'"' /etc/xray/config.json
trojan="trojan://${pass}@${domain}:443#${namatoko}-${user}"
xtls="trojan://${pass}@${domain}:443/?sni=bugmu.com&security=xtls&flow=xtls-rprx-direct#${namatoko}-${user}"
ws="trojan://${pass}@${domain}:443?encryption=none&host=${domain}&path=%2Ftrojan&type=ws#${namatoko}-${user}"
grpc="trojan://${pass}@${domain}:443/?sni=${domain}&type=grpc&host=${domain}&serviceName=Trojan-GRPC&encryption=none#${namatoko}-${user}"
systemctl restart xray
clear
echo -e ""
echo -e "=======-XRAY/TROJAN======="
echo -e "Remarks: ${namatoko}-${user}"
echo -e "Domain: ${domain}"
echo -e "Password: ${pass}"
echo -e "Security: auto"
echo -e "AllowInsecure: true"
echo -e "=======-PLUGIN TCP TLS======="
echo -e "Port: 443"
echo -e "Network: tcp"
echo -e "tls: true"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN WS TLS======="
echo -e "Port: 443"
echo -e "Network: ws"
echo -e "tls: true"
echo -e "path: /trojan"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN GRPC TLS======="
echo -e "Port: 443"
echo -e "Network: grpc"
echo -e "tls: true"
echo -e "gRPC Mode: gun/multi"
echo -e "ServiceName: Trojan-GRPC"
echo -e "alpn: h2"
echo -e "================================="
echo -e "Trojan TCP XTLS : ${xtls}"
echo -e "================================="
echo -e "Trojan TCP TLS : ${trojan}"
echo -e "================================="
echo -e "Trojan WS TLS : ${ws}"
echo -e "================================="
echo -e "Trojan GRPC TLS : ${grpc}"
echo -e "================================="
echo -e "Expired On: $exp"
