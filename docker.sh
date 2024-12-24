sudo apt update -y ; sudo apt upgrade -y ; sudo apt install docker docker.io ca-certificates curl gnupg -y
wget https://github.com/docker/buildx/releases/download/v0.19.2/buildx-v0.19.2.linux-amd64
mv *buildx* /bin/buildx
sudo chmod +x /bin/buildx
mkdir rom ; cd rom ; wget https://raw.githubusercontent.com/Frostleaft07/krepes/refs/heads/main/Dockerfile
buildx build .
