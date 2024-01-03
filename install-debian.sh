#!/bin/bash
# // Starting Setup Domain
clear;
echo -e "${GREEN}Indonesian Language${NC}";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo -e "Anda Ingin Menggunakan Domain Pribadi ?";
echo -e "Atau Ingin Menggunakan Domain Otomatis ?";
echo -e "Jika Ingin Menggunakan Domain Pribadi, Ketik ${GREEN}1${NC}";
echo -e "dan Jika Ingin menggunakan Domain Otomatis, Ketik ${GREEN}2${NC}";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo "";
echo -e "${GREEN}English Language${NC}";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo -e "You Want to Use a Private Domain ?";
echo -e "Or Want to Use Auto Domain ?";
echo -e "If You Want Using Private Domain, Type ${GREEN}1${NC}";
echo -e "else You Want using Automatic Domain, Type ${GREEN}2${NC}";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo "";

read -p "$( echo -e "${GREEN}Input Your Choose ? ${NC}(${YELLOW}1/2${NC})${NC} " )" choose_domain

# // Validating Automatic / Private
if [[ $choose_domain == "2" ]]; then # // Using Automatic Domain

wget -q https://github.com/simakan12/tohlol/raw/main/cfzero.sh && chmod +x cfzero.sh && ./cfzero.sh

# // Input Result To VPS
domain=$(cat /root/domain);

# // Success
echo -e "${OKEY} Your Domain : $domain";
sleep 2;
clear;

# // ELif For Selection 1
elif [[ $choose_domain == "1" ]]; then

# // Clear
clear;
echo -e "${GREEN}Indonesian Language${NC}";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo -e "Silakan Pointing Domain Anda Ke IP VPS";
echo -e "Untuk Caranya Arahkan NS Domain Ke Cloudflare";
echo -e "Kemudian Tambahkan A Record Dengan IP VPS";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo "";
echo -e "${GREEN}Indonesian Language${NC}";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo -e "Please Point Your Domain To IP VPS";
echo -e "For Point NS Domain To Cloudflare";
echo -e "Change NameServer On Domain To Cloudflare";
echo -e "Then Add A Record With IP VPS";
echo -e "${YELLOW}-----------------------------------------------------${NC}";
echo "";
echo "";

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

# // Else Do
else
    echo -e "${ERROR} Please Choose 1 & 2 Only !";
    exit 1;
fi

#data
read -rp "Masukkan nama-toko: " toko
echo "$toko" > /root/namatoko
namatoko=$(cat /root/namatoko)
read -rp "Masukkan Nomor WA: " nomorwa
echo "$nomorwa" > /root/nomorwa
nowa=$(cat /root/nomorwa)
read -rp "Masukkan Alamat Email: " email
echo "$email" > /root/alamatemail
alamatemail=$(cat /root/alamatemail)
mkdir /var/lib/premium-script/
echo "IP=$domain" >> /var/lib/premium-script/ipvps.conf

#Preparation
clear
cd;
apt-get update;

#Remove unused Module
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove bind9*;

#install bbr
echo 'fs.file-max = 500000
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.netdev_max_backlog = 250000
net.core.somaxconn = 4096
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_mem = 25600 51200 102400
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.core.rmem_max=4000000
net.ipv4.tcp_mtu_probing = 1
net.ipv4.ip_forward=1
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
sysctl -p;

#install toolkit
apt-get install git libio-socket-inet6-perl libsocket6-perl libcrypt-ssleay-perl libnet-libidn-perl perl libio-socket-ssl-perl libwww-perl libpcre3 libpcre3-dev zlib1g-dev dbus iftop zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr dnsutils sudo at htop iptables bsdmainutils cron lsof -y

#Install lolcat
apt-get install -y ruby;
gem install lolcat;

#Set Timezone GMT+7
timedatectl set-timezone Asia/Jakarta;

#profile
echo -e 'profile' >> /root/.profile
wget -O /usr/bin/profile "$sfile/sale/profile.sh";
chmod +x /usr/bin/profile
apt install neofetch -y

#Install VNSTAT
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install 
cd
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz 
rm -rf /root/vnstat-2.6

#Install Speedtest
apt-get install debian-archive-keyring curl gnupg apt-transport-https -y
mkdir -p /etc/apt/keyrings/
curl -fsSL https://packagecloud.io/ookla/speedtest-cli/gpgkey | gpg --dearmor > /etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg] https://packagecloud.io/ookla/speedtest-cli/debian/ `lsb_release -cs` main
deb-src [signed-by=/etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg] https://packagecloud.io/ookla/speedtest-cli/debian/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ookla_speedtest-cli.list
apt-get update
apt install speedtest -y

#install nginx
echo "deb http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
apt update
apt install nginx -y
rm /etc/nginx/conf.d/default.conf
wget -O /etc/nginx/nginx.conf "$sfile/sale/nginx.conf"
wget -O /etc/nginx/conf.d/vps.conf "$sfile/sale/vps.conf"
wget -O /etc/nginx/conf.d/xray.conf "$sfile/sale/xray.conf"
systemctl enable nginx
mkdir -p /var/www/html
echo "<br>
<br>
<br>
<br>
<br>
<br>
<center><h1>Welcome Customer DKLONGTONG</h1></center>
<center><h1>Ready Script Auto Install VPN VPS</h1></center>
<center><h1>Akun SSH / VPN</h1></center>
<center><h1>Shoope = <a href='https://shopee.co.id/dklongtong?v=d41&smtt=0.0.10'> Click </a></h1></center>
<center><h1>Telegram = <a href='https://t.me/DKLONGTONG'> Click </a></h1></center>
" > /var/www/html/index.html
systemctl start nginx

#install xray
apt install iptables -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion -y
wget $sfile/sale/go.sh && chmod +x go.sh && ./go.sh
rm -f /root/go.sh

#install cert
curl https://get.acme.sh | sh -s email=$alamatemail
/root/.acme.sh/acme.sh --register-account -m $alamatemail --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
cat > /etc/systemd/system/xray.service <<-END
[Unit]
Description=XRay Service
Documentation=https://www.v2ray.com/ https://www.v2fly.org/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/xray/xray -config /etc/xray/config.json
Restart=on-failure
LimitNOFILE=infinity


[Install]
WantedBy=multi-user.target
END
cat > /etc/systemd/system/xray@.service <<-END
[Unit]
Description=XRay Service
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/xray/xray -config /etc/xray/%i.json
Restart=on-failure
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
END
uuid=$(cat /proc/sys/kernel/random/uuid)
sspass=$(openssl rand -base64 16)
cat >/etc/xray/config.json <<EOF
{
        "log": {
                "access": "/var/log/xray/access.log",
                "error": "/var/log/xray/error.log",
                "loglevel": "warning"
        },
        "api": {
                "tag": "api",
                "services": [
                        "StatsService"
                ]
        },
        "dns": {
                "servers": [
                        "1.1.1.1"
                ],
                "queryStrategy": "UseIPv4"
        },
        "routing": {
                "domainStrategy": "IPIfNonMatch",
                "rules": [
                        {
                                "inboundTag": [
                                        "api"
                                ],
                                "outboundTag": "api",
                                "type": "field"
                        }
                ]
        },
        "policy": {
                "levels": {
                        "0": {
                                "statsUserUplink": true,
                                "statsUserDownlink": true
                        }
                },
                        "system": {
                        "statsInboundUplink": false,
                        "statsInboundDownlink": false,
                        "statsOutboundUplink": false,
                        "statsOutboundDownlink": false
                                }
        },
	"inbounds": [
        {
            "port": 443,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "$uuid","flow": "xtls-rprx-direct","email": "bawaantrojantcp"
#trojan
                   }
                ],
		"decryption": "none",
		"fallbacks": [
			{
				"dest": "/dev/shm/default.sock",
				"xver": 1
			},
			{
				"alpn": "h2",
				"dest": "/dev/shm/h2c.sock",
				"xver": 1
			},
			{
				"path": "/trojan",
				"dest": 2001,
				"xver": 1
			},
			{
				"path": "/vmess",
				"dest": 2002,
				"xver": 1
			},
			{
				"path": "/ss",
				"dest": 2003,
				"xver": 1
			},
			{
				"path": "/vless",
				"dest": 2004,
				"xver": 1
          }
        ]
      },
    "streamSettings": {
        "network": "tcp",
        "security": "xtls",
        "xtlsSettings": {
	  	"alpn":["h2", "http/1.1"],
          "minVersion": "1.2",
          "cipherSuites": "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384:TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256:TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256",
          "certificates": [
            {
              "ocspStapling": 3600,
              "certificateFile": "/etc/xray/xray.crt",
              "keyFile": "/etc/xray/xray.key",
			  "usage": "encipherment"
            }
          ]
        }
      },
	   "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    },
    {
            "port": 2001,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password" : "$uuid","email": "bawaantrws"
#ws

                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "acceptProxyProtocol" : true,
                    "path" : "/trojan"
                }
			},
	"sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    },
   {
      "listen": "127.0.0.1",
      "port": 31304,
      "protocol": "trojan",
      "settings": {
        "clients": [
          {
            "password":"$uuid","email": "bawaantrgrpc"
#trgrpc

          }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": 885
                    }
                ]
            },
		"streamSettings": {
        	"network": "grpc",
        	"grpcSettings": {
        	"serviceName": "Trojan-GRPC",
			    "acceptProxyProtocol": true,
			    "multiMode": true
        	}
       },
        "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
	  	  ]
        }
      },
    {
      "listen": "127.0.0.1",
      "port": 56802,
      "protocol": "vmess",
      "settings": {
        "clients": [
	{
            "id":"$uuid","email": "bawaanvmgrpc"
#vmgrpc

          }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": 885
                    }
                ]
            },
      "streamSettings": {
        "network": "grpc",
        "security": "none",
        "grpcSettings": {
          "acceptProxyProtocol": true,
          "serviceName": "Vmess-GRPC",
          "multiMode": true
        }
      },
	"sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
          ]
        }
      },
      {
            "port": 2002,
            "listen": "127.0.0.1",
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id" : "$uuid","email": "bawaanvmws"
#vmess

                   }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "acceptProxyProtocol" : true,
                    "path" : "/vmess"
                     }
		},
	"sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
          ]
       }
    },
	{
            "port": 2004,
            "listen": "127.0.0.1",
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$uuid","email": "bawaanvlws"
#vless

                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "acceptProxyProtocol": true,
                    "path": "/vless"
                }
            },
		"sniffing": {
        "enabled": true,
        "destOverride": [
	  	  "http",
          "tls"
        ]
      }
    },
    {
      "listen": "127.0.0.1",
      "port": 56803,
      "protocol": "vless",
      "settings": {
		"clients": [
		{
            "id":"$uuid","email": "bawaanvlgrpc"
#vlgrpc

          }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": 885
                    }
                ]
            },
      "streamSettings": {
        "network": "grpc",
        "security": "none",
        "grpcSettings": {
          "acceptProxyProtocol": true,
          "serviceName": "Vless-GRPC",
          "multiMode": true
        }
      },
	"sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
          ]
        }
      },
    {
      "tag": "api",
      "listen": "127.0.0.1",
      "port": 47466,
      "protocol": "dokodemo-door",
       "settings": {
                     "address": "127.0.0.1"
                        }
                }
        ],
                "outbounds": [
                {
                  "tag": "direct",
                  "protocol": "freedom",
                   "settings": {
                             "domainStrategy": "UseIPv4"
                        }
                },
                {
                  "tag": "block",
                  "protocol": "blackhole",
                    "settings": {}
                }
        ],
        "stats": {}
}
EOF
cat >/etc/xray/none.json <<EOF
{
        "log": {
                "access": "/var/log/xray/access2.log",
                "error": "/var/log/xray/error.log",
                "loglevel": "warning"
        },
        "api": {
                "tag": "api",
                "services": [
                        "StatsService"
                ]
        },
        "dns": {
                "servers": [
                        "1.1.1.1"
                ],
                "queryStrategy": "UseIPv4"
        },
        "routing": {
                "domainStrategy": "IPIfNonMatch",
                "rules": [
                        {
                                "inboundTag": [
                                        "api"
                                ],
                                "outboundTag": "api",
                                "type": "field"
                        }
                ]
        },
        "policy": {
                "levels": {
                        "0": {
                                "statsUserUplink": true,
                                "statsUserDownlink": true
                        }
                },
                        "system": {
                        "statsInboundUplink": false,
                        "statsInboundDownlink": false,
                        "statsOutboundUplink": false,
                        "statsOutboundDownlink": false
                                }
        },
"inbounds": [
        {
            "port": 80,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$uuid","email": "bawaanvlwsnon"
#vless
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/vless"
                }
            },
        "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    },
    {
            "port": 80,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "$uuid","email": "bawaanvmwsnon"
#vmess
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/vmess"
                }
            },
        "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
          ]
        }
      },
    {
      "tag": "api",
      "listen": "127.0.0.1",
      "port": 47465,
      "protocol": "dokodemo-door",
       "settings": {
                     "address": "127.0.0.1"
                        }
                }
        ],
                "outbounds": [
                {
                  "tag": "direct",
                  "protocol": "freedom",
                   "settings": {
                             "domainStrategy": "UseIPv4"
                        }
                },
                {
                  "tag": "block",
                  "protocol": "blackhole",
                    "settings": {}
                }
        ],
        "stats": {}
}
EOF
cat >/etc/xray/sso.json <<EOF
{
        "log": {
                "access": "/var/log/xray/access2.log",
                "error": "/var/log/xray/error2.log",
                "loglevel": "warning"
        },
        "api": {
                "tag": "api",
                "services": [
                        "StatsService"
                ]
        },
        "dns": {
                "servers": [
                        "1.1.1.1"
                ],
                "queryStrategy": "UseIPv4"
        },
        "routing": {
                "domainStrategy": "IPIfNonMatch",
                "rules": [
                        {
                                "inboundTag": [
                                        "api"
                                ],
                                "outboundTag": "api",
                                "type": "field"
                        }
                ]
        },
        "policy": {
                "levels": {
                        "0": {
                                "statsUserUplink": true,
                                "statsUserDownlink": true
                        }
                },
 				"system": {
                        "statsInboundUplink": false,
                        "statsInboundDownlink": false,
                        "statsOutboundUplink": false,
                        "statsOutboundDownlink": false
 				}
        },
        "inbounds": [
        {
            "port": 2500,
            "protocol": "shadowsocks",
            "settings": {
                "clients": [
                    {
                        "password": "$uuid",
                        "method": "aes-128-gcm",
                        "email": "bawaan"
#sso
                        }
                ],
                "network": "tcp,udp"
                        }
                },
                {
                        "tag": "api",
                        "listen": "127.0.0.1",
                        "port": 10085,
                        "protocol": "dokodemo-door",
                        "settings": {
                                "address": "127.0.0.1"
                        }
                }
        ],
		"outbounds": [
                {
                        "tag": "direct",
                        "protocol": "freedom",
                        "settings": {
                                "domainStrategy": "UseIPv4"
                        }
                },
                {
                        "tag": "block",
                        "protocol": "blackhole",
                        "settings": {}
                }
        ],
        "stats": {}
}
EOF
systemctl enable xray
systemctl start xray
systemctl enable xray@none
systemctl start xray@none
systemctl enable xray@sso
systemctl start xray@sso
systemctl restart nginx
cd /usr/bin
wget -O base-script "$sfile/sale/base-script.sh"
wget -O allvpn "$sfile/sale/allvpn.sh"
wget -O addtr "$sfile/sale/addtr.sh"
wget -O addtrgo "$sfile/sale/addtrgo.sh"
wget -O addtrojan "$sfile/sale/addtr2.sh"
wget -O addtrws "$sfile/sale/addws.sh"
wget -O addvmws "$sfile/sale/addvmess.sh"
wget -O addvmess "$sfile/sale/addvmess2.sh"
wget -O addvlws "$sfile/sale/addvless.sh"
wget -O addvless "$sfile/sale/addvless2.sh"
wget -O addsso "$sfile/sale/addsso.sh"
wget -O addtrgrpc "$sfile/sale/addtrgrpc.sh"
wget -O addvmgrpc "$sfile/sale/addvmgrpc.sh"
wget -O addvlgrpc "$sfile/sale/addvlgrpc.sh"
wget -O cekerror "$sfile/sale/cekerror.sh"
wget -O ceklog "$sfile/sale/ceklog.sh"
wget -O cektr "$sfile/sale/cektr.sh"
wget -O cektrws "$sfile/sale/cekws.sh"
wget -O cekvmws "$sfile/sale/cekvmess.sh"
wget -O ceksso "$sfile/sale/ceksso.sh"
wget -O cekvlws "$sfile/sale/cekvless.sh"
wget -O clearlog-oto "$sfile/sale/clearlog_otomatis.sh"
wget -O deltr "$sfile/sale/deltr.sh"
wget -O deltrgrpc "$sfile/sale/deltrgrpc.sh"
wget -O delvmgrpc "$sfile/sale/delvmgrpc.sh"
wget -O delvlgrpc "$sfile/sale/delvlgrpc.sh"
wget -O deltrws "$sfile/sale/delws.sh"
wget -O delvmws "$sfile/sale/delvmess.sh"
wget -O delsso "$sfile/sale/delsso.sh"
wget -O delvlws "$sfile/sale/delvless.sh"
wget -O renewcert "$sfile/sale/renewcert.sh"
wget -O renewtr "$sfile/sale/renewtr.sh"
wget -O renewtrgrpc "$sfile/sale/renewtrgrpc.sh"
wget -O renewvmgrpc "$sfile/sale/renewvmgrpc.sh"
wget -O renewvlgrpc "$sfile/sale/renewvlgrpc.sh"
wget -O renewtrws "$sfile/sale/renewws.sh"
wget -O renewvmws "$sfile/sale/renewvmess.sh"
wget -O renewsso "$sfile/sale/renewsso.sh"
wget -O renewvlws "$sfile/sale/renewvless.sh"
wget -O xptr "$sfile/sale/xptr.sh"
wget -O xptrgrpc "$sfile/sale/xptrgrpc.sh"
wget -O xpvmgrpc "$sfile/sale/xpvmgrpc.sh"
wget -O xpvlgrpc "$sfile/sale/xpvlgrpc.sh"
wget -O xpws "$sfile/sale/xpws.sh"
wget -O xpvmws "$sfile/sale/xpvmess.sh"
wget -O xpsso "$sfile/sale/xpsso.sh"
wget -O xpvlws "$sfile/sale/xpvless.sh"
wget -O expired "$sfile/sale/exp_otomatis.sh"
wget -O clearlog "$sfile/sale/clearlog.sh"
wget -O cektrf "$sfile/sale/cektrf.sh"
wget -O cektrf-sso "$sfile/sale/cektrf-sso.sh"
wget -O cektrf-none "$sfile/sale/cektrf-none.sh"
wget -O cekservice "$sfile/sale/cekservice.sh"
wget -O cek-kuota "$sfile/sale/cek-kuota.sh"
wget -O menu "$sfile/sale/menu.sh"
wget -O menu-akun "$sfile/sale/menu-akun.sh"
wget -O menu-trojan "$sfile/sale/menu-trojan.sh"
wget -O menu-vmess "$sfile/sale/menu-vmess.sh"
wget -O menu-vless "$sfile/sale/menu-vless.sh"
wget -O renew-trojan "$sfile/sale/renew-trojan.sh"
wget -O renew-vmess "$sfile/sale/renew-vmess.sh"
wget -O renew-vless "$sfile/sale/renew-vless.sh"
wget -O cek-trojan "$sfile/sale/cek-trojan.sh"
wget -O cek-vmess "$sfile/sale/cek-vmess.sh"
wget -O cek-vless "$sfile/sale/cek-vless.sh"
wget -O del-trojan "$sfile/sale/del-trojan.sh"
wget -O del-vmess "$sfile/sale/del-vmess.sh"
wget -O del-vless "$sfile/sale/del-vless.sh"
wget -O restart_services "$sfile/sale/restart_services.sh"
wget -O ram "$sfile/sale/ram"
wget -O backup "$sfile/sale/backup.sh"
wget -O restore "$sfile/sale/restore.sh"
wget -O backup-restore "$sfile/sale/backup-restore.sh"
chmod +x backup
chmod +x cektrf-none
chmod +x restore
chmod +x backup-restore
chmod +x menu
chmod +x menu-akun
chmod +x base-script
chmod +x cek-trojan
chmod +x cek-vmess
chmod +x cek-vless
chmod +x del-trojan
chmod +x del-vmess
chmod +x del-vless
chmod +x renew-trojan
chmod +x renew-vmess
chmod +x renew-vless
chmod +x menu-trojan
chmod +x menu-vmess
chmod +x menu-vless
chmod +x restart_services
chmod +x ram
chmod +x allvpn
chmod +x addtr
chmod +x addtrgo
chmod +x addtrojan
chmod +x addtrws
chmod +x addvmws
chmod +x addvmess
chmod +x addvless
chmod +x addvlws
chmod +x addsso
chmod +x addtrgrpc
chmod +x addvmgrpc
chmod +x addvlgrpc
chmod +x cekerror
chmod +x ceklog
chmod +x cektr
chmod +x cektrws
chmod +x cekvmws
chmod +x ceksso
chmod +x cekvlws
chmod +x clearlog-oto
chmod +x deltr
chmod +x deltrgrpc
chmod +x delvmgrpc
chmod +x delvlgrpc
chmod +x deltrws
chmod +x delvmws 
chmod +x delsso 
chmod +x delvlws 
chmod +x renewcert 
chmod +x renewtr 
chmod +x renewtrgrpc 
chmod +x renewvmgrpc 
chmod +x renewvlgrpc 
chmod +x renewtrws 
chmod +x renewvmws 
chmod +x renewsso 
chmod +x renewvlws 
chmod +x xptr 
chmod +x xptrgrpc 
chmod +x xpvmgrpc 
chmod +x xpvlgrpc 
chmod +x xpws 
chmod +x xpvmws
chmod +x xpsso
chmod +x xpvlws
chmod +x expired
chmod +x clearlog
chmod +x cektrf
chmod +x cektrf-sso
chmod +x cekservice
chmod +x cek-kuota
cd
echo "0 0 * * * root expired" >> /etc/cron.d/xp_exp
echo "0 */6 * * * root clearlog-oto" >> /etc/cron.d/clearlog

#Install reboot otomatis
wget -O /root/reboot_otomatis.sh "$sfile/sale/reboot_otomatis.sh";
chmod +x /root/reboot_otomatis.sh;
echo "30 4 * * * root /root/reboot_otomatis.sh" > /etc/cron.d/reboot_otomatis;
systemctl restart cron;

#Tambahan
cd
wget -q http://sg.warnetgrg.my.id:81/tohlol/tambah/set-br.sh && chmod +x set-br.sh && ./set-br.sh

#change limit
echo '* soft nofile 500000' >> /etc/security/limits.conf
echo '* hard nofile 500000' >> /etc/security/limits.conf
ulimit -n 500000
apt autoremove -y
apt clean
profile
# Service
touch /root/log-install.txt
echo "   >>> Service & Port"  | tee -a /root/log-install.txt
echo "   - Nginx                        : 885" | tee -a /root/log-install.txt
echo "   - Xray Trojan GFW/TCP TLS/XTLS : 443" | tee -a /root/log-install.txt
echo "   - Xray Trojan GO/WS            : 443" | tee -a /root/log-install.txt
echo "   - Xray Trojan GRPC             : 443" | tee -a /root/log-install.txt
echo "   - Xray VMess WS TLS            : 443" | tee -a /root/log-install.txt
echo "   - Xray VMess WS nonTLS         : 80" | tee -a /root/log-install.txt
echo "   - Xray VMess GRPC              : 443" | tee -a /root/log-install.txt
echo "   - Xray VLess WS TLS            : 443" | tee -a /root/log-install.txt
echo "   - Xray VLess WS nonTLS         : 80" | tee -a /root/log-install.txt
echo "   - Xray ShadowSocks Outline     : 2500" | tee -a /root/log-install.txt
echo ""  | tee -a /root/log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a /root/log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a /root/log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a /root/log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a /root/log-install.txt
echo "   - Firewall                : [ON]"  | tee -a /root/log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a /root/log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a /root/log-install.txt
echo "   - Autoreboot On           : 04.30 WIB" | tee -a /root/log-install.txt
echo ""
echo " Reboot 15 Sec"
history -c
sleep 15
rm -f setup.sh
reboot
