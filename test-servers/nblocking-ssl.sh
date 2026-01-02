#!/usr/bin/env sh



(
  cd ..
  lein javac
  ## Works
  PORT=8443
  java \
      -Djavax.net.ssl.trustStore=test-servers/ssl/truststore.jks \
      -Djavax.net.ssl.trustStorePassword=httpkit \
      -Djavax.net.ssl.trustStoreType=JKS \
      -Dorg.httpkit.client.NBlockingSSL.host=api.localhost \
      "-Dorg.httpkit.client.NBlockingSSL.port=$PORT" \
      -Dorg.httpkit.client.NBlockingSSL.file=project.clj \
      -classpath "$(lein with-profile +dev classpath)" \
      org.httpkit.client.NBlockingSSL
  ## Fails
  PORT=9443
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
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
