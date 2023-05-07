#!/bin/bash

firewall-cmd --permanent --zone=public --add-masquerade
firewall-cmd --permanent --zone=public --add-rich-rule='rule family=ipv4 source address=192.168.4.0/16 masquerade'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family=ipv4 source address=192.168.4.0 forward-port port=80 protocol=tcp to-port=3128 to-addr=192.168.4.2'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family=ipv4 source address=192.168.4.0 forward-port port=443 protocol=tcp to-port=3128 to-addr=192.168.4.2'
firewall-cmd --permanent --zone=public --add-service=samba
firewall-cmd --permanent --zone=public --add-port=3128/tcp
firewall-cmd --permanent --zone=public --add-port=3129/tcp
firewall-cmd --permanent --zone=public --add-port=3126/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --reload
