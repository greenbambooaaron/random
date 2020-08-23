#!/bin/bash
echo -e "Blocking BitTorrent Strings in IPTABLES"
iptables -A INPUT -m string --string "BitTorrent" --algo bm -j DROP
iptables -A INPUT -m string --string "BitTorrent protocol" --algo bm -j DROP
iptables -A INPUT -m string --string "peer_id=" --algo bm -j DROP
iptables -A INPUT -m string --string ".torrent" --algo bm -j DROP
iptables -A INPUT -m string --string "announce.php?passkey=" --algo bm -j DROP
iptables -A INPUT -m string --string "torrent" --algo bm -j DROP
iptables -A INPUT -m string --string "announce" --algo bm -j DROP
iptables -A INPUT -m string --string "info_hash" --algo bm -j DROP
iptables -A INPUT -m string --string "tracker" --algo bm -j DROP
iptables -A INPUT -m string --string "get_peers" --algo bm -j DROP
iptables -A INPUT -m string --string "announce_peer" --algo bm -j DROP
iptables -A INPUT -m string --string "find_node" --algo bm -j DROP
iptables -A INPUT -p tcp --syn --dport 8080 -m connlimit --connlimit-above 32 -j REJECT --reject-with tcp-reset
echo -e "IPTABLES now filering most BitTorrent connections"
