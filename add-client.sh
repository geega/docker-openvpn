
#!/usr/bin/env bash


read -p "Enter Your client name (Example: my_phone, tablet, laptop, pc-name): "  clientname
echo "You input:  $clientname"

while true; do
    read -p "Do you correct is client name?" yn
    case $yn in
        [Yy]* ) docker-compose run --rm openvpn easyrsa build-client-full $clientname nopass && exit;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
