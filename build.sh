docker build -f build/Dockerfile build -t static-build
docker run -v $(pwd):/workdir -w /workdir static-build g++ -static build/hello.cpp -o run/hello

docker build -f run/Dockerfile run -t static-run
