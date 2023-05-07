#!/bin/bash

yum install openssl -y
yum install squid -y
cd /etc/squid
openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 -keyout bump.key -out bump.crt
openssl x509 -in bump.crt -outform DER -out bump.der
openssl dhparam -outform PEM -out /etc/squid/bump_dhparam.pem 2048
chown squid:squid /etc/squid/bump*
chmod 400 /etc/squid/bump*
mkdir -p /var/lib/squid
rm -rf /var/lib/squid/ssl_db
/usr/lib64/squid/security_file_certgen -c -s /var/lib/squid/ssl_db -M 20MB
chown -R squid:squid /var/lib/squid
