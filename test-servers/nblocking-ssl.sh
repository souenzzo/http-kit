#!/usr/bin/env sh

(
  cd ..
  ## Works
  PORT=8443
  ## Fails
  # PORT=9443
  lein javac
  java \
    -Djavax.net.ssl.trustStore=test-servers/ssl/truststore.jks \
    -Djavax.net.ssl.trustStorePassword=httpkit \
    -Djavax.net.ssl.trustStoreType=JKS \
    -Dorg.httpkit.client.NBlockingSSL.host=api.localhost \
    "-Dorg.httpkit.client.NBlockingSSL.port=$PORT" \
    -Dorg.httpkit.client.NBlockingSSL.file=project.clj \
    -classpath "$(lein with-profile +dev classpath)" \
    org.httpkit.client.NBlockingSSL
)
