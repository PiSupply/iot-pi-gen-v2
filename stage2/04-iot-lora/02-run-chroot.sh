export DEBIAN_FRONTEND=noninteractive
apt-get install -yq samba

curl -sSL https://get.docker.com | sh

usermod -aG docker pi
pip3 install wheel
pip3 install docker-compose

mkdir /opt/iotloragateway/
cd /opt/iotloragateway/

git clone https://github.com/PiSupply/iot-lora-gw-docker.git

cd iot-lora-gw-docker

#Manually jus run parts of the update file
install -m 644 iot-lora-gateway.service /lib/systemd/system/
install -m 644 iot-lora-gateway-restarter.service /lib/systemd/system/
install -m 644 iot-lora-gateway-eth-switcher.service /lib/systemd/system/

systemctl daemon-reload


#./iot-lora-gw-docker-update.sh

systemctl disable smbd.service

#Change default SSH port
sed -i -e 's/#Port 22/Port 386/g' /etc/ssh/sshd_config

rm /etc/sudoers.d/010_pi-nopasswd


echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades
