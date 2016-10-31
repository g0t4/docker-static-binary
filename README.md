# docker-static-binary

An example of baking a static linked linux binary into a container alone with nothing else

To run this demo execute `./demo.sh` and follow along with the output

Check the size of the resultant docker image:
`docker images static-run`

Cleanup:
```bash
docker rmi static-build static-run
```

## Under the covers

If you want to see what happens when the binary isn't static linked, drop the `-static` flag from the call to `g++`

Then, run an interactive shell in a container based on the `static-build` image:
`docker run --rm -it -v $(pwd):/workdir -w /workdir static-build sh`

Run ldd to list dynamic dependencies:
`ldd run/hello`

Try this with and without the `-static` `g++` flag.
