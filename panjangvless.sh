#!/bin/bash
if [[ "$IP" = "" ]]; then
domain=$(cat /root/domain)
namatoko=$(cat /root/namatoko)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                read -rp "User: " -e user
                read -rp "UUID: " -e idid
                CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

                if [[ ${CLIENT_EXISTS} == '1' ]]; then
                        echo ""
                        echo "A client with the specified name was already created, please choose another name."
                        exit 1
                fi
        done
uuid=${idid}
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\### '"Vless $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vlessws-$user""'"' /etc/xray/config.json
sed -i '/#vless$/a\### '"Vless $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vlessws-$user""'"' /etc/xray/none.json
sed -i '/#vlgrpc$/a\### '"Vlgrpc $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vlessgrpc-$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${namatoko}-${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${namatoko}-${user}"
vlesslink3="vless://${uuid}@${domain}:443?encryption=none&security=tls&type=grpc&host=${domain}&serviceName=Vless-GRPC#${namatoko}-${user}"
systemctl restart xray
systemctl restart xray@none
clear
echo -e ""
echo -e "=======-XRAY/VLESS======="
echo -e "Remarks: ${namatoko}-${user}"
echo -e "Domain: ${domain}"
echo -e "uuid: ${uuid}"
echo -e "Encryption: none"
echo -e "AllowInsecure: true"
echo -e "=======-PLUGIN WS TLS======="
echo -e "Port: 443"
echo -e "Network: ws"
echo -e "tls: true"
echo -e "path: /vless"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN WS nonTLS======="
echo -e "Port: 80"
echo -e "Network: ws"
echo -e "tls: none"
echo -e "path: /vless"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN GRPC TLS======="
echo -e "Port: 443"
echo -e "Network: grpc"
echo -e "tls: true"
echo -e "gRPC Mode: gun/multi"
echo -e "ServiceName: Vless-GRPC"
echo -e "alpn: h2"
echo -e "================================="
echo -e "VLess WS-TLS : ${vlesslink1}"
echo -e "================================="
echo -e "VLess WS-nonTLS : ${vlesslink2}"
echo -e "================================="
echo -e "VLess GRPC : ${vlesslink3}"
echo -e "================================="
echo -e "Expired On: $exp"