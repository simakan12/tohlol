#!/bin/bash
curl https://github.com/simakan12/tohlol/raw/main/install.sh | bash
printf "q\n" | rclone config
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user fotocopyroy@gmail.com
from fotocopyroy@gmail.com
password winfykylijokqxqy
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://github.com/simakan12/tohlol/raw/main/autobackup.sh"
wget -O backup "https://github.com/simakan12/tohlol/raw/main/backup.sh"
wget -O bckp "https://github.com/simakan12/tohlol/raw/main/bckp.sh"
wget -O restore "https://github.com/simakan12/tohlol/raw/main/restore.sh"
wget -O limit-speed "https://github.com/simakan12/tohlol/raw/main/limit-speed.sh"
wget -O change-domain "https://github.com/simakan12/tohlol/raw/main/change-domain.sh"
wget -O changedomain "https://github.com/simakan12/tohlol/raw/main/changedomain.sh"
wget -O ganti "https://github.com/simakan12/tohlol/raw/main/changedomain2.sh"
wget -O ulang "https://github.com/simakan12/tohlol/raw/main/ulang.sh"
chmod +x autobackup
chmod +x backup
chmod +x bckp
chmod +x restore
chmod +x limit-speed
chmod +x change-domain
chmod +x changedomain
chmod +x ganti
chmod +x ulang
cd
apt install wondershaper -y;
apt install iptables -y;
apt install iptables-persistent -y;
cd
mkdir -p /usr/local/wildydev21/
wget -q -O /usr/local/wildydev21/udp-mini "https://github.com/simakan12/tohlol/raw/main/udp-mini";
chmod +x /usr/local/wildydev21/udp-mini;
wget -q -O /etc/systemd/system/udp-mini-1.service "https://github.com/simakan12/tohlol/raw/main/udp-mini-1.service";
wget -q -O /etc/systemd/system/udp-mini-2.service "https://github.com/simakan12/tohlol/raw/main/udp-mini-2.service";
wget -q -O /etc/systemd/system/udp-mini-3.service "https://github.com/simakan12/tohlol/raw/main/udp-mini-3.service";
systemctl disable udp-mini-1 > /dev/null 2>&1;
systemctl stop udp-mini-1 > /dev/null 2>&1;
systemctl enable udp-mini-1;
systemctl start udp-mini-1;
systemctl disable udp-mini-2 > /dev/null 2>&1;
systemctl stop udp-mini-2 > /dev/null 2>&1;
systemctl enable udp-mini-2;
systemctl start udp-mini-2;
systemctl disable udp-mini-3 > /dev/null 2>&1;
systemctl stop udp-mini-3 > /dev/null 2>&1;
systemctl enable udp-mini-3;
systemctl start udp-mini-3;
apt install netfilter-persistent -y;
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP;
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP;
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP;
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP;
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP;
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP;
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP;
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP;
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP;
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP;
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP;
iptables -A FORWARD -m string --string "BitTorrent" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "peer_id=" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string ".torrent" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "torrent" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "info_hash" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "/default.ida?" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string ".exe?/c+dir" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string ".exe?/c_tftp" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "peer_id" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "BitTorrent" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "bittorrent-announce" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "find_node" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "info_hash" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "get_peers" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce_peers" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "BitTorrent" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "peer_id=" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string ".torrent" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "torrent" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "info_hash" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "/default.ida?" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string ".exe?/c+dir" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string ".exe?/c_tftp" --algo bm --to 65535 -j DROP
iptables -A FORWARD -m string --string "peer_id" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "BitTorrent" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "bittorrent-announce" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "find_node" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "info_hash" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "get_peers" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce" --algo kmp --to 65535 -j DROP
iptables -A FORWARD -m string --string "announce_peers" --algo kmp --to 65535 -j DROP
iptables-save > /etc/iptables.up.rules;
iptables-restore -t < /etc/iptables.up.rules;
netfilter-persistent save;
netfilter-persistent reload;
apt install fail2ban -y;
/etc/init.d/fail2ban restart;
rm -f /root/set-br.sh