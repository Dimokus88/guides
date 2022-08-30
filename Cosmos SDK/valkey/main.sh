#!/bin/bash
# By Dimokus (https://t.me/Dimokus)
source $HOME/.bashrc
#-----------КОМПИЛЯЦИЯ БИНАРНОГО ФАЙЛА------------
git clone https://github.com/cosmos/gaia.git
cd gaia && make install

cp $HOME/gaia/build/gaiad /usr/bin/
cp $HOME/go/bin/gaiad /usr/bin/
gaiad version

gaiad  init MONIKER --chain-id GAIA 

cat /root/.gaia/config/priv_validator_key.json
sleep infinity
