#!/bin/bash
echo -e "Setting TCP Rules to Use BBR Congestion Control"
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
lsmod | grep bbr
echo "net.core.rmem_max = 67108864" | sudo tee -a /etc/sysctl.conf
echo "net.core.wmem_max = 67108864" | sudo tee -a /etc/sysctl.conf
echo "net.core.wmem_default = 65536" | sudo tee -a /etc/sysctl.conf
echo "net.core.rmem_default = 65536" | sudo tee -a /etc/sysctl.conf
echo "net.core.netdev_max_backlog = 4096" | sudo tee -a /etc/sysctl.conf
echo "net.core.somaxconn = 4096" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_syncookies = 1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse = 1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_fin_timeout = 30" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_keepalive_time = 1200" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 10000 65000" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog = 4096" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_max_tw_buckets = 5000" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_fastopen = 3" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_rmem = 4096 87380 67108864" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_wmem = 4096 65536 67108864" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_mtu_probing = 1" | sudo tee -a /etc/sysctl.conf
sysctl -p && reboot && exit
