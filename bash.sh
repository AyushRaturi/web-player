#!/bin/bash

# Update system
sudo apt-get update -y

# Check and install git
if ! command -v git &> /dev/null; then
    sudo apt-get install git -y
fi
git --version

# Clone repository (if needed)
# git clone https://github.com/AyushRaturi/Web-player.git

# Check and install docker
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-docker.sh
fi
docker --version

# Build docker image
docker build . -t web-player

# Run docker image
docker run -p 6969:80 -d web-player
