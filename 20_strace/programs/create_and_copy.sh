#!/usr/bin/env bash

mkdir -p ./out
touch ./out/file.txt
cp ./out/file.txt ./out/file2.txt
echo "$(date +%s.%N)" >> ./out/file.txt
