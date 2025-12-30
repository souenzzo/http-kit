#!/usr/bin/env sh

. stdenv.sh

docker run \
  --network host \
  --rm \
  -v ./ssl:/ssl:ro \
  alpine/curl \
  --cacert "ssl/$SERVER_NAME.crt" \
  --no-progress-meter "$@"
