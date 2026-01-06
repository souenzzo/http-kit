#!/usr/bin/env sh

java \
  -Djavax.net.ssl.trustStore=ssl/truststore.jks \
  -Djavax.net.ssl.trustStorePassword=httpkit \
  -Djavax.net.ssl.trustStoreType=JKS \
  "$@"
