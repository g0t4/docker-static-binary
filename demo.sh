#!/bin/bash

echo 0. Remove existing run/hello binary
rm run/hello

echo 1. Build our build environment:
docker build -f build/Dockerfile build -t static-build
echo -e "\n"
echo 2. Run our build environment, to produce a standalone executable:
docker run --rm -v $(pwd):/workdir -w /workdir static-build gcc -static build/hello.c -o run/hello

echo -e "\n"
echo 3. Build our runtime environment: just copy the static linked binary in a container image:
docker build -f run/Dockerfile run -t static-run

echo -e "\n"
echo 4. Run our runtime environment:
docker run --rm static-run

echo -e "\n" 
echo 5. Binary size:
ls -lh run/hello
