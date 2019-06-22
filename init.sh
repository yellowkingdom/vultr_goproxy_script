#!/bin/sh

url=$(curl -sb -H "Accept: application/json" https://api.github.com/repos/snail007/goproxy/releases/latest | grep browser_download_url | grep linux-amd64 | awk -F '"browser_download_url":' '{print $2}' | sed 's/\"//g' );
wget $url
tar -xvf proxy-linux-amd64.tar.gz
echo '' > blocked
./proxy socks -t tcp -p "0.0.0.0:8080" -a "[username]:[password]" &
