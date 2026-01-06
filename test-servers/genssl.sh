#!/usr/bin/env sh

. stdenv.sh

mkdir -p ssl

openssl genrsa -out "./ssl/$SERVER_NAME.key" 2048

openssl req -new \
  -subj "/C=BR/ST=Rio/L=Rio/O=HttpKit/OU=OSS/CN=$SERVER_NAME" \
  -key "./ssl/$SERVER_NAME.key" \
  -out "./ssl/$SERVER_NAME.csr"

openssl x509 -req -days 365 \
  -in "./ssl/$SERVER_NAME.csr" \
  -signkey "./ssl/$SERVER_NAME.key" \
  -out "./ssl/$SERVER_NAME.crt"

keytool -import -trustcacerts -alias "$SERVER_NAME" \
  -file "ssl/$SERVER_NAME.crt" \
  -keystore ssl/truststore.jks \
  -storepass httpkit \
  -noprompt
