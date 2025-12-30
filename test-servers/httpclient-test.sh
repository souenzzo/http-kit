#!/usr/bin/env sh

clojure \
  -J-Djavax.net.ssl.trustStore=ssl/truststore.jks \
  -J-Djavax.net.ssl.trustStorePassword=httpkit \
  -J-Djavax.net.ssl.trustStoreType=JKS \
  -Sdeps '{:deps {http-kit/http-kit {:mvn/version "2.8.1"}}}' -M \
  -e "(require '[org.httpkit.client :as c])" \
  -e '(def rs ["https://api.localhost:8443" "https://api.localhost:9443"])' \
  -e '(doseq [r rs] (-> r c/get deref :status prn))'


