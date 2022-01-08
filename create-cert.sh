#!/usr/bin/env bash
echo 'Please come up with a name like my_phone, tablet, laptop, pc-name etc.'
read -p "For create cert name. Enter Your client name: "  clientname
echo "You input:  $clientname"

while true; do
    read -p "Do you correct is client name? " yn
    case $yn in
        [Yy]* ) docker-compose run --rm openvpn easyrsa build-client-full $clientname nopass  && docker-compose run --rm openvpn ovpn_getclient $clientname > certificates/$clientname.ovpn  && exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done