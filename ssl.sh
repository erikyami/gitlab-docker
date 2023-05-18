#!/bin/bash


mkdir -p ./files/config/ssl
mkdir -p ./files/{data,logs}

DOMAIN=wildcard.hl.local


#openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:2048 -out ${DOMAIN}.key
#openssl req -new -key ${DOMAIN}.key -out ${DOMAIN}.csr
#openssl x509 -req -days 3650 -signkey ${DOMAIN}.key -in ${DOMAIN}.csr -out ${DOMAIN}.crt

cp ${DOMAIN}.crt ./files/config/ssl/
cp ${DOMAIN}.key ./files/config/ssl/
