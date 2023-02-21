Configures a tf2 server for use with MGEME

This image cribs heavily from https://github.com/spiretf/docker-comp-server and https://github.com/spiretf/docker-tf2-server

don't make the same mistake i did, make sure your ubuntu image is up to date. `docker pull ubuntu:latest`  
build with: `docker build . -t myimgname`  
run with `docker run -dit -p27015:27015 --name mycontainer myimgname`  
