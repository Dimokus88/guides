#!/bin/bash
# By Dimokus (https://t.me/Dimokus)
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
sleep 5
export PATH=$PATH:/usr/local/go/bin
source $HOME/.bashrc
go version
#-----------КОМПИЛЯЦИЯ БИНАРНОГО ФАЙЛА------------
cd /root/
git clone https://github.com/cosmos/gaia.git
cd gaia && make install

cp $HOME/gaia/build/gaiad /usr/bin/
cp $HOME/go/bin/gaiad /usr/bin/
gaiad version

gaiad  init MONIKER --chain-id GAIA 

cat /root/.gaia/config/priv_validator_key.json
sleep infinity
