# docker-static-binary

An example of baking a static linked linux binary into a container alone with nothing else

To run this demo execute `./demo.sh` and follow along with the output

Check the size of the resultant docker image:
`docker images static-run`

Cleanup:
```bash
docker rmi static-build static-run
```
