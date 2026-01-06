# Testing with local servers and self-signed certificates

Start all HTTPS servers

```shell
# cd test-servers
docker compose up
```

Run the clojure test

```shell
# cd test-servers
./httpclient-test.sh
## Sample success output
# #'user/rs
# 200
# 200
```
