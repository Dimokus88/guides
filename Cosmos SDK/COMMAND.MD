## Commands for the command line of Cosmos SDK ecosystem projects.
## Команды для командной строки проектов экосистемы Cosmos SDK.

> $binary - здесь бинарный файл проекта, у каждого он свой, как и denom и chain-id
> $binary - here is the binary file of the project, each has its own, like denom and chain-id
 
 1. [Account (wallet) commands | Команды аккаунта (кошелька)](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B0%D0%BA%D0%BA%D0%B0%D1%83%D0%BD%D1%82%D0%B0-%D0%BA%D0%BE%D1%88%D0%B5%D0%BB%D1%8C%D0%BA%D0%B0)
 2. [Validator Commands | Команды валидатора](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B2%D0%B0%D0%BB%D0%B8%D0%B4%D0%B0%D1%82%D0%BE%D1%80%D0%B0)
 3. [Voting commands | Команды голосования](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B3%D0%BE%D0%BB%D0%BE%D1%81%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
 4. [Network settings commands | Команды настроек сети](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BA-%D1%81%D0%B5%D1%82%D0%B8)
 
##### Account (wallet) commands
 
##### Команды аккаунта (кошелька)

Create wallet | Cоздать кошелек

```
$binary keys add <WALLET_NAME> --keyring-backend os
```

Restore wallet (after insert seed command) | Восстановить кошелек (после команды вставить seed)

```
$binary keys add <WALLET_NAME> --recover --keyring-backend os
```

Connect ledger wallet | Подключить кошелек ledger

```
$binary keys add <WALLET_NAME> --ledger 
```

Check balance | Проверить баланс

```
$binary keys q bank balances <ADDRESS>
```

Send 1 token to another address | Отправить 1 токен на другой адрес

```
$binary tx bank send <ADDRESS_FROM> <ADDRESS_TO> 1000000$denom --fees 500$denom -y
```

[UP | Наверх](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD#commands-for-the-command-line-of-cosmos-sdk-ecosystem-projects) .

##### Validator Commands
##### Команды валидатора

Create a validator | Создать валидатора

```
$binary tx staking create-validator --amount="1000000$denom" --pubkey=$($binary tendermint show-validator) --moniker="$MONIKER"	--chain-id="$chain"	--commission-rate="0.10" --commission-max-rate="0.20" --commission-max-change-rate="0.01" --min-self-delegation="1000000" --gas="auto"	--from="$address" --fees="555$denom" -y
```

Check validator pubkey | Проверить pubkey валидатора

```
$binary tendermint show-validator
```

Check validator | Проверить валидатора

```
$binary query staking validator <valoper_address>
```

```
$binary query staking validators --limit 1000000 -o json | jq '.validators[] | select(.description.moniker=="<имя_ноды>")' | jq
```
  
Collect commissions + rewards | Собрать комиссионные + реварды

```
$binary tx distribution withdraw-rewards <valoper_address> --from <ADDRESS> --fees 500$denom --commission -y
```

Delegate 1 token to yourself (1 token = 1,000,000 tokens) | Заделегировать себе  1 токен (1 токен = 1 000 000 uтокена)

```
$binary tx staking delegate <valoper_address> 1000000$denom --from <ADDRESS> --fees 500$denom -y
```

[UP | Наверх](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD#commands-for-the-command-line-of-cosmos-sdk-ecosystem-projects) .
  
##### Voting commands
##### Команды голосования
  
Proposal list | Список предложений

```
$binary q gov proposals
```
  
View the result of the vote | Посмотреть результат голосования

```
$binary q gov proposals --voter <ADDRESS>
```
  
Vote for the proposal | Проголосовать за предложение 

```
$binary tx gov vote 1 yes --from <ADDRESS> --fees 555$denom
```
  
Make a deposit to the proposal | Внести депозит в предложение

```
$binary tx gov deposit 1 1000000utori --from <ADDRESS> --fees 555$denom
```

Create an proposal | Создать предложение

```
$binary tx gov submit-proposal --title="Randomly reward" --description="Reward 10 testnet participants who completed more than 3 tasks" --type="Text" --deposit="11000000$denom" --from <ADDRESS> --fees 500$denom
```
  
[UP | Наверх](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD#commands-for-the-command-line-of-cosmos-sdk-ecosystem-projects) .
  
  
##### Network settings commands

##### Команды настроек сети
  
Network settings | Параметры сети

```
$binary q staking params
```

```
$binary q slashing params
```

Get out of jail | Выбраться из тюрьмы

```
$binary tx slashing unjail --from <ADDRESS> --fees 500$denom -y
```

```
$binary q slashing signing-info <valoper_address> --trust-node
```

Check Status | Проверить статус

```
curl localhost:26657/status
```

[UP | Наверх](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/COMMAND.MD#commands-for-the-command-line-of-cosmos-sdk-ecosystem-projects) .
