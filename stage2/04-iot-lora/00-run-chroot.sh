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

#Change default SSH port
sed -i -e 's/#Port 22/Port 386/g' /etc/ssh/sshd_config

rm /etc/sudoers.d/010_pi-nopasswd
