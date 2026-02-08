# checking docker version
docker --version

# build the docker image
docker build . -t web-player

# run the docker image
docker run -p 6969:80 -d web-player
