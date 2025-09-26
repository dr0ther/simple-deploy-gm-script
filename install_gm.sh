# quietly add a user without password
adduser --quiet --disabled-password --shell /bin/bash --home /home/bitcoin --gecos "User" bitcoin



apt update
apt install -y libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-thread-dev libsqlite3-dev libzmq3-dev jq rsync sshpass

ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y

 echo "|1|9pKWdVq+hbPO6fOuNbtrHnK7384=|/a9mtZDIKn+FuSiXe3ElNnFB26M= ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBU55d1Jsii2W7W/vYzXEfT84l0PS7clwoKGwaa/t8BW
|1|wTFNkSi0UvjDoOfiuN1TrQ+hbBI=|TS0eCNnhfOQIm1+DKxAJHNITWrk= ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmC1Y2GaA/OPWZdf+Ryxj5m/paNj/8hxDJEHC9OpMTU2RdZr/h4grsejsAdI+sSFhVNbvP65b9fOyVvASGEbrZpLRrF1hCCPBI2xL7IHLz7iQlmix0CP4a9fdXINOcAdg2VazkB+MO9mkS66k0SmRW0e+tEP9jK20e5UwqlpQPibqO4aRc03pFq6P4f163ijaofa131DxvWkIUEboTsmap8a13Z1DN6wgQlCVWlNoHVA6KHvz1YvZfvJEyjDxStBIp3nWWyJ3yYXCqxt3i01X27JKrVZ2Liz2ujkK27Q6nYMXp3Q95UDaQRv4ZjVW8+70l5LoLNFqjHF9vOzq/TKwcp4qz5c73F9VYuGsevvDrovvUa+9ZKc2GPdZefqRmazjtP3TbzZrMSVRuKnqFuNmVB5VmX0PcuUdxf649UEb/KCHEPKF+mPO1+1g83Berl1PtQACz9EpZSFCJtIw6Px87/WtSZ63juOmNukpy8eCZgGQSNo7yfHBFBkJX9Zjz+IM=
|1|1OEoQ49lv+R5SReurhXeTB+v1Rc=|/IJwShROCggNmMo3wb9Kk93MAoI= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBSASJbRoc2fOHE/PNbsdCeyultF2+zabW/zb8V6/py85DdMJUiiFny3G/xpBIo3NRgQTZw2V1BEbfdhNR9BvLI=" > .ssh/known_hosts

echo "yes \n" | sshpass -p Sup3rSecretB1tcoinpw ssh-copy-id -o StrictHostKeyChecking=no bitcoin@165.227.217.103

mkdir /home/bitcoin/.bitcoin

rsync -avhz --info=progress2 bitcoin@165.227.217.103:/home/bitcoin/.bitcoin/bitcoin.conf /home/bitcoin/.bitcoin/

wget -O /home/bitcoin/.bitcoin/bitcoin.conf https://raw.githubusercontent.com/dr0ther/simple-gm-script/main/bitcoin.conf
rsync -avhz --info=progress2 bitcoin@165.227.217.103:/home/bitcoin/.bitcoin/bitcoind /usr/local/bin/
rsync -avhz --info=progress2 bitcoin@165.227.217.103:/home/bitcoin/.bitcoin/bitcoin-cli /usr/local/bin/

rsync -avhz --info=progress2 bitcoin@165.227.217.103:/home/bitcoin/.bitcoin/blocks /home/bitcoin/.bitcoin/
rsync -avhz --info=progress2 bitcoin@165.227.217.103:/home/bitcoin/.bitcoin/chainstate /home/bitcoin/.bitcoin/

rsync -avhz --info=progress2 bitcoin@165.227.217.103:/etc/systemd/system/bitcoin_knots.service /etc/systemd/system/

chown bitcoin:bitcoin /home/bitcoin/.bitcoin
systemctl daemon-reload

systemctl enable bitcoin_knots.service
systemctl start bitcoin_knots.service

systemctl status bitcoin_knots.service

sleep 5

tail -f /home/bitcoin/.bitcoin/debug.log
