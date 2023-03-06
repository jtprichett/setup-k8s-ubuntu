
# Clone repo
git clone https://github.com/Mirantis/cri-dockerd.git

# Install Go

set -e 

arch="$(uname -m)"
echo "$arch"
if [[ "$arch" == "aarch64" ]]; then
    if [[ ! -f "./go1.20.1.linux-arm64.tar.gz" ]]; then
            wget -q https://go.dev/dl/go1.20.1.linux-arm64.tar.gz
    fi
    rm -rf /usr/local/go
    tar -C /usr/local -xzf go1.20.1.linux-arm64.tar.gz
fi
export PATH=$PATH:/usr/local/go/bin
go version

# Install CRI dockerd
cd cri-dockerd
mkdir bin
go build -o bin/cri-dockerd
mkdir -p /usr/local/bin
install -o root -g root -m 0755 bin/cri-dockerd /usr/local/bin/cri-dockerd
cp -a packaging/systemd/* /etc/systemd/system
sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
systemctl daemon-reload
systemctl enable cri-docker.service
systemctl enable --now cri-docker.socket
systemctl status cri-docker.service
