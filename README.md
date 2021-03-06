# OpenVPN 

OpenVPN server in a Docker container complete with an EasyRSA PKI CA


### Install 

1. Copy or clone repositry 
2. Init server run command `init.sh`  or 

```
docker-compose run --rm openvpn ovpn_genconfig -u udp://{vpn_server_address}
docker-compose run --rm openvpn ovpn_initpki
```  
`{vpn_server_address}` - domain or static ip (Ex: vpn.example.com or 123.123.123.123)

When generating the certificate, enter the control phrase (Enter PEM pass phrase) and the certificate name (Common Name).

Please do not forget this phrase, because it will be needed in the next step when creating client certificates.

3. Start server run command `start.sh`
```
docker-composer up -d 
```

### Start server 

Run command start.sh 

### Add client and export certificate 

1. Generate a client certificate without a passphrase run command `add-client.sh` or 

```
docker-compose run --rm openvpn easyrsa build-client-full {client_name} nopass  
```

`{client_name}` - client name without spaces. Example: my_phone, laptop, home_pc, server_1

When creating the certificate, you will be asked to enter the control phrase (Enter passpharse) from the previous step.

2. Export the client configuration with embedded certificates run command `export-cart-openvpn.sh` or 

```
docker-compose run --rm openvpn ovpn_getclient {client_name} > client-configs/{client_name}.ovpn  
```
`{client_name}` - client name without spaces. Example: my_phone, laptop, home_pc, server_1



# TODO 

1. Automatic detect IP for init step
2. Optimize script for add client + export 
