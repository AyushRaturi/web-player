#!/bin/bash

set -e

: << 'TASK'
Shell script for deploying web player using Docker
TASK

echo "************************** Deployment Started **************************"


# -------------------- Check Git --------------------

check_git() {

    echo "Checking Git..."

    if command -v git >/dev/null 2>&1; then
        echo "✅ Git found: $(git --version)"
    else
        echo "⚙️ Git not found. Installing..."

        sudo apt update -y || { echo "❌ apt update failed"; exit 101; }

        sudo apt install -y git || { echo "❌ Git installation failed"; exit 102; }

        command -v git >/dev/null 2>&1 || { echo "❌ Git still not installed"; exit 103; }

        echo "✅ Git installed successfully"
    fi
}


# -------------------- Clone Repo --------------------

clone_repo() {

    echo "Checking repository..."

    if [ -d "web-player" ]; then
        echo "📁 Repository already exists"
    else
        echo "⬇️ Cloning repository..."

        git clone https://github.com/AyushRaturi/web-player.git || { 
            echo "❌ Repository clone failed"; 
            exit 201; 
        }

        echo "✅ Repository cloned"
    fi
}


# -------------------- Install Docker --------------------

install_docker() {

    echo "Checking Docker..."

    if command -v docker >/dev/null 2>&1; then
        echo "✅ Docker already installed: $(docker --version)"
        return
    fi

    echo "⚙️ Installing Docker..."

    sudo apt update -y || { echo "❌ apt update failed"; exit 301; }

    sudo apt install -y ca-certificates curl gnupg lsb-release || { 
        echo "❌ Dependency installation failed"; 
        exit 302; 
    }

    sudo install -m 0755 -d /etc/apt/keyrings || { 
        echo "❌ Failed creating keyrings directory"; 
        exit 303; 
    }

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg || { 
        echo "❌ Docker GPG key failed"; 
        exit 304; 
    }

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || { 
        echo "❌ Docker repo setup failed"; 
        exit 305; 
    }

    sudo apt update -y || { echo "❌ apt update failed"; exit 306; }

    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || { 
        echo "❌ Docker installation failed"; 
        exit 307; 
    }

    sudo systemctl enable docker --now || { 
        echo "❌ Docker service failed to start"; 
        exit 308; 
    }

    echo "✅ Docker installed successfully"
}


# -------------------- Setup Docker --------------------

setup_docker() {

    echo "Configuring Docker permissions..."

    sudo usermod -aG docker $USER || { 
        echo "❌ Failed to add user to docker group"; 
        exit 401; 
    }

    sudo chmod 666 /var/run/docker.sock || { 
        echo "❌ Failed to change docker socket permission"; 
        exit 402; 
    }

    echo "✅ Docker permissions configured"
}


# -------------------- Deploy Application --------------------

deploy_app() {

    echo "Starting deployment..."

    if [ ! -d "web-player" ]; then
        echo "❌ Repository directory not found"
        exit 501
    fi

    cd web-player || { 
        echo "❌ Failed to enter project directory"; 
        exit 502; 
    }

    docker --version >/dev/null 2>&1 || { 
        echo "❌ Docker not installed properly"; 
        exit 503; 
    }

    echo "Building Docker image..."

    docker build -t web-player . || { 
        echo "❌ Docker build failed"; 
        exit 504; 
    }

    echo "Starting container..."

    docker compose up -d --build || { 
        echo "❌ Docker compose failed"; 
        exit 505; 
    }

    echo "✅ Application deployed successfully"
}


# -------------------- Run Steps --------------------

check_git
clone_repo
install_docker
setup_docker
deploy_app


echo "************************** Deployment Successful **************************"