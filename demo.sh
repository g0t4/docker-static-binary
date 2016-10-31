#!/bin/bash

# Remove previous build output
rm run/hello

# First we need to build the static linked binary, we do this in an alpine linux container with g++
echo 1. Build our build environment:
docker build -f build/Dockerfile build -t static-build
echo -e "\n"
echo 2. Run our build environment, to produce a static linked binary:
docker run --rm -v $(pwd):/workdir -w /workdir static-build g++ -static build/hello.cpp -o run/hello

echo -e "\n"
echo 3. Build our runtime environment: just copy the static linked binary in a container image:
docker build -f run/Dockerfile run -t static-run

echo -e "\n"
echo 4. Run our runtime environment:
docker run --rm static-run
