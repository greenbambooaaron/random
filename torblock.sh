#!/bin/bash
echo -e "Getting Tor node list from github mirrored from dan.me.uk"
wget -q -O - https://www.dan.me.uk/torlist/ > /tmp/full.tor
CMD=$(cat /tmp/full.tor | uniq | sort)
for IP in $CMD; do
    let COUNT=COUNT+1
    ufw deny from $IP
done
echo -e "UFW now blocking TOR connections"
