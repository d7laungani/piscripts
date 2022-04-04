## Install Docker

sudo apt-get update && sudo apt-get upgrade
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
echo 'export PATH=/usr/bin:$PATH' >> ~/.bashrc
echo 'export DOCKER_HOST=unix:///run/user/1000/docker.sock' >> ~/.bashrc


## Fix Docker permissions
sudo sh -eux <<EOF
# Install newuidmap & newgidmap binaries
apt-get install -y uidmap
EOF
dockerd-rootless-setuptool.sh install
sudo loginctl enable-linger pi
sudo systemctl restart docker

## Install Docker Compose

sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose

# ENable DOcker to start containers on boot

sudo systemctl enable docker

# Test docker installation
docker run hello-world
