export DEBIAN_FRONTEND=noninteractive
apt-get install -yq samba

curl -sSL https://get.docker.com | sh

usermod -aG docker pi
pip3 install wheel
pip3 install docker-compose

mkdir /opt/iotloragateway/
cd /opt/iotloragateway/

git clone https://github.com/PiSupply/iot-lora-gw-docker.git

systemctl disable smbd.service
