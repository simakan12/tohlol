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
sed -i '/#vmess$/a\### '"Vmess $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vmessws-$user""'"' /etc/xray/config.json
sed -i '/#vmess$/a\### '"Vmess $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vmessws-$user""'"' /etc/xray/none.json
sed -i '/#vmgrpc$/a\### '"Vmgrpc $user $exp"'\
},{"id": "'""$uuid""'","email": "'""vmessgrpc-$user""'"' /etc/xray/config.json
tls=`cat<<EOF
      {
      "v": "2",
      "ps": "${namatoko}-${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF`
none=`cat<<EOF
      {
      "v": "2",
      "ps": "${namatoko}-${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
 {
      "v": "2",
      "ps": "${namatoko}-${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "Vmess-GRPC",
      "type": "gun",
      "host": "",
      "tls": "tls"
}
EOF`
vmesslink1="vmess://$(echo $tls | base64 -w 0)"
vmesslink2="vmess://$(echo $none | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray
systemctl restart xray@none
clear
echo -e ""
echo -e "=======-XRAY/VMESS======="
echo -e "Remarks: ${namatoko}-${user}"
echo -e "Domain: ${domain}"
echo -e "uuid: ${uuid}"
echo -e "Security: auto"
echo -e "AlterID: 0"
echo -e "AllowInsecure: true"
echo -e "=======-PLUGIN WS TLS======="
echo -e "Port: 443"
echo -e "Network: ws"
echo -e "tls: true"
echo -e "path: /vmess"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN WS nonTLS======="
echo -e "Port: 80"
echo -e "Network: ws"
echo -e "tls: none"
echo -e "path: /vmess"
echo -e "alpn: http/1.1"
echo -e "=======-PLUGIN GRPC TLS======="
echo -e "Port: 443"
echo -e "Network: grpc"
echo -e "tls: true"
echo -e "gRPC Mode: gun/multi"
echo -e "ServiceName: Vmess-GRPC"
echo -e "alpn: h2"
echo -e "================================="
echo -e "VMess WS-TLS : ${vmesslink1}"
echo -e "================================="
echo -e "VMess WS-nonTLS : ${vmesslink2}"
echo -e "================================="
echo -e "VMess GRPC : ${vmesslink3}"
echo -e "================================="
echo -e "Expired On: $exp"
