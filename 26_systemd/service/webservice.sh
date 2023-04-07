#!/usr/bin/env bash
echo "Start webserver"
RESPONSE="HTTP/1.1 200 OK\r\nConnection: close\r\n\r\n${2:-"OK"}\r\n"
while { echo -en "$RESPONSE $MY_VAR"; } | nc -lN "${1:-8080}"; do
  echo "================================================"
done
