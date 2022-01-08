#!/usr/bin/env bash

read -p "Enter Your hostname (Example: vpn.example.com or  123.123.123.123): "  hostname
echo "Is correct hostname:  $hostname!"

while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) docker-compose run --rm openvpn ovpn_genconfig -u udp://$hostname  && docker-compose run --rm openvpn ovpn_initpki && exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
