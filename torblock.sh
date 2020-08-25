#!/bin/bash
echo -e "Getting Tor exit node list from GITHUB (mirrored from dan.me.uk)"
wget -q -O - https://raw.githubusercontent.com/greenbambooaaron/random/master/torexitlist20200825 > /tmp/full.tor
CMD=$(cat /tmp/full.tor | uniq | sort)
for IP in $CMD; do
    let COUNT=COUNT+1
    ufw deny from $IP
done
echo -e "UFW now blocking TOR Exit Nodes"
