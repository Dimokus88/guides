# Разверка нод на базе Cosmos SDK в сети Akash.

<div align="center">

![pba](https://user-images.githubusercontent.com/23629420/163564929-166f6a01-a6e2-4412-a4e9-40e54c821f05.png)
| [Akash Network](https://akash.network/) | [Forum Akash Network](https://forum.akash.network/) | 
|:--:|:--:|
___

Подпишитесь на наши новостные каналы:

| [Discord Akash](https://discord.gg/WR56y8Wt) | [Telegram Akash EN](https://t.me/AkashNW) | [Telegram Akash RU](https://t.me/akash_ru) | [TwitterAkash](https://twitter.com/akashnet_) | [TwitterAkashRU](https://twitter.com/akash_ru) |
|:--:|:--:|:--:|:--:|:--:|

</div>

### Содержание:

1. [Предисловие](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BF%D1%80%D0%B5%D0%B4%D0%B8%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D0%B5).
2. [Deploy.yml полной ноды (RPC ноды)](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#deployyml-%D0%BF%D0%BE%D0%BB%D0%BD%D0%BE%D0%B9-%D0%BD%D0%BE%D0%B4%D1%8B-rpc-%D0%BD%D0%BE%D0%B4%D1%8B).
3. [Deploy.yml валидатора сети](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#deployyml-%D0%B2%D0%B0%D0%BB%D0%B8%D0%B4%D0%B0%D1%82%D0%BE%D1%80%D0%B0-%D1%81%D0%B5%D1%82%D0%B8). 
4. [Если у вас еще нет этого файла priv_validator_key.json ](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%B5%D1%81%D0%BB%D0%B8-%D1%83-%D0%B2%D0%B0%D1%81-%D0%B5%D1%89%D0%B5-%D0%BD%D0%B5%D1%82-%D1%8D%D1%82%D0%BE%D0%B3%D0%BE-%D1%84%D0%B0%D0%B9%D0%BB%D0%B0-priv_validator_keyjson).
5. [Процесс развертывания](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%81-%D1%80%D0%B0%D0%B7%D0%B2%D0%B5%D1%80%D1%82%D1%8B%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F).
6. [Команды экосистемы Cosmos SDK](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B4%D0%BB%D1%8F-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%BD%D0%BE%D0%B9-%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BA%D0%B8-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%BE%D0%B2-%D1%8D%D0%BA%D0%BE%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B-cosmos-sdk).

### Предисловие

В этом гайде я опишу свои наработки направлении нод (в том числе валидатора) на базе **Cosmos SDK**.
Основными особенностями нод на базе **Cosmos SDK** это стандартизация служб, каталогов, запросов и ключей, как кошельков(аккаунтов) так и ключей валидатора.
Таким образом, для тестовых сетей стандарта Cosmos SDK **можно использользовать одну и туже seed фразу для кошелька, файл priv_validator_key.json** . 

**Для развертки ноды в основной сети рекомендуется использовать индивидуальные кошельки и ключи валидатора!**

Для тестнетов, универсальным вариантом является размещение ```priv_validator_key.json```, например на Google диск следуя [этой части инструкции](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%B5%D1%81%D0%BB%D0%B8-%D1%83-%D0%B2%D0%B0%D1%81-%D0%B5%D1%89%D0%B5-%D0%BD%D0%B5%D1%82-%D1%8D%D1%82%D0%BE%D0%B3%D0%BE-%D1%84%D0%B0%D0%B9%D0%BB%D0%B0-priv_validator_keyjson).
Но пойдем по порядку:

### Deploy.yml полной ноды (RPC ноды).

Основой запуска нод стандарта **Cosmos SDK** у меня является этот [скрипт](https://github.com/Dimokus88/universe/blob/main/main.sh).
Для запуска ноды без функции валидатора вам потребуется просто скопировать этот [deploy.yml](https://github.com/Dimokus88/universe/blob/main/alphatest/deployRPCnode.yml), заполнить переменные для необходимой вам сети и развернуть его в **Akash Network** через CLI или
пользовательский интерфейс Akashlytics, [инструкция по использованию Akashlytics](https://github.com/Dimokus88/guides/blob/main/Akashlytics/RU-guide.md) прилагается.

Можете воспользоваться готовыми решениями или подключится самостоятельно используя описание ниже.

Остановимся на переменных из **deploy.yml**, которые необходимо заполнить если вы **не** используете готовые решения.

Первый вопрос - откуда брать данные? И логичный ответ - из технической документации проекта! 

Даже если у проекта необходимого гайда - всегда можно покопаться в его **github** =) .

     - "my_root_password=" - Скрипт разворачивается с активным sshd, что бы иметь возможность подключится внутрь котейнера под пользователем root введити пароль для него.
     - "MONIKER=" - Имя ноды, используйте уникальное имя ноды.
     - "binary=" - бинарный файл проекта, то есть то что как раз и станет службой ноды. Часто имеют в конце наименования 'd', например для SEI это seid, для Stride это strided и т.д.
     - "vers=" - актуальная версия бинарного файла, можно подсмотреть в releases на гитхаб
     - "genesis=" - RAW ссылка на генезис файл проекта
     - "folder=" - папка проекта,имеет точку в начале (скрытая папка) и как правило название такое же как и проект, например для sei имя папки .sei, для  Stride имя папки .stride (*РЕГИСТР ИМЕЕТ ЗНАЧЕНИЕ!*)
     - "denom=" - малая доля токена проекта, например для sei деном usei, для Stride деном ustrd.
     - "chain=" - название актуального блокчейна (chain-id). В процессе тестнета проекты могут несколько раз менять как версии бинарных файлов, так и сети.
     - "gitrep=" - репозиторий с проектом, например для Stride это https://github.com/Stride-Labs/stride.git
     - "gitfold=" - папка в репозитории где находится Makefile для компиляции бинарного файла, как правило это то что стоит перед .git в ссылке выше, для Stride это папка stride.
     - "link_peer=" - Ссылка на набор пиров для подключения, так же можете использовать вместо этого переменную PEER. Так же есть переменная SEED, для добавления сидов.
     - "link_rpc=" - Ссылка на набор RPC нод для подключения, если у вас только одна нода используйте только переменную SNAP_RPC .
     - "SHIFT=2000" - количество блоков "вниз" от последнего при state sync синхронизации ( если не синхронизироваться с 0 блока)
     - "SNAP_RPC=" - любая активная RPC нода из которой можно взять данные по актуальным блокам и хешам к ним.

Как я описал уже выше, всю эту информацию можно найти на **github** проекта.

Далее рассмотрим **deploy.yml** для ноды **валидатора сети**.

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).

### Deploy.yml валидатора сети. 

Здесь как и в [предъидущем пункте](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#deployyml-%D0%BF%D0%BE%D0%BB%D0%BD%D0%BE%D0%B9-%D0%BD%D0%BE%D0%B4%D1%8B-rpc-%D0%BD%D0%BE%D0%B4%D1%8B) используется тот же [скрипт](https://github.com/Dimokus88/universe/blob/main/main.sh) . Для запуска ноды валидатора в [deploy.yml](https://github.com/Dimokus88/universe/blob/main/alphatest/deployValidatorNode.yml) к переменным из пункта выше мы добавляем переменные:

     - "MNEMONIC=" - seed фраза от кошелька (аккаунта) валидатора. Seed фразу можете сгенерировать в любом кошельке экосиситемы Cosmos SDK, например Keplr или Cosmostation
     - "LINK_KEY=" - ссылка на прямое скачивание priv_validator_key.json, как ее получить описано тут. Если у вас еще нет этого файла - оставьте эту строку пустой и обратитесь к этой части.
     - "validator_node=yes" - указываем что это нода валидатора
     - "autodelegate=" - для включения функции автоделегирования присвойте значение переменной yes (autodelegate=yes)

Для создания валидатора вам потребуются токены тестовой сети, их можно запросить **в социальных сетях проекта у команды**.

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).

#### Если у вас еще нет этого файла priv_validator_key.json:

* С помощью Akashlytics разверните обыную ноду проекта, инструкция по использованию Akashlytics можно найти [здесь](https://github.com/Dimokus88/guides/blob/main/Akashlytics/RU-guide.md).

* Во вкладке ```LOGS``` дождитесь сообщения о сгенерированном файле ```priv_validator_key.json``` .

<div align="center">
  
![image](https://user-images.githubusercontent.com/23629420/174469544-3c25b9ff-2ee8-49db-92e9-5e101d4c0be9.png)
  
</div>

* Во вкладке ```SHELL``` выполните команду ```cat /root/<.folder>)/config/priv_validator_key.json``` (где <.folder> - папка вашего проекта), ответ сохраните локально в файле ```priv_validator_key``` с расширением ```.json```.

<div align="center">
  
![image](https://user-images.githubusercontent.com/23629420/174469553-e9a9a129-c17d-4cc6-b09a-a0cba0104634.png)
  
</div>


> Откройте доступ к файлу на ```google``` диск и скопируйте его ссылку, она будет вида:
```https://drive.google.com/open?id=xxxxxxxxxxxxxx-xxxxxxxxxxxx&authuser=gmail%40gmail.com&usp=drive_fs`` воспользуйтесь сервисом по генерации ссылок для скачивания или создайте ссылку самостятельно, 
для этого вам нужно взять часть: ```id=xxxxxxxxxxxxxx-xxxxxxxxxxxx``` и вставить перед ней: ```https://drive.google.com/uc?export=download&```.  
Таким образом, у вас получится ссылка на прямое скачивание файла:
```https://drive.google.com/uc?export=download&id=xxxxxxxxxxxxxx-xxxxxxxxxxxx``` . Сохраните ее.

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).

## Процесс развертывания.

* Проверяем наличие баланса (>5АКТ) и наличие установленного сертификата.

![image](https://user-images.githubusercontent.com/23629420/165339432-6f053e43-4fa2-4429-8eb7-d2fc66f47c70.png)

* Нажимаем ```CREATE DEPLOYMENT```. Выбираем ```Empty```(пустой template) и копируем туда содержимое deploy.yml .

Ниже, в поле ```resources``` мы выставляем арендуемую мощность.

Нажимаем кнопку ```CREATE DEPLOYMENT``` и ждем появления провайдеров, со свободными мощностями (***BIDS***).

![image](https://user-images.githubusercontent.com/23629420/165608527-da85c84e-edcc-4b15-8843-441d3e76dcb6.png)

* Выбираем подходящий для нас по цене и оборудованию. После чего нажимаем ```ACCEPT BID```.

Ждем заверщения развертывания.

* В вкладке ```LOGS``` можете наблюдать работу ноды.  После чего будет создан валидатор (если он не был созда ранее) и нода войдет в автоматический режим работы.

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).

## Команды для командной стороки проектов экосистемы Cosmos SDK.

Как я уже написал в начале статьи Cosmos SDK это стандарт, команды для нод на базе Cosmos SDK тока же будут отвечать общим принципам.

> $binary - здесь бинарный файл проекта, у каждого он свой, как и denom и chain-id
 
 1. [Команды аккаунта (кошелька)](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B0%D0%BA%D0%BA%D0%B0%D1%83%D0%BD%D1%82%D0%B0-%D0%BA%D0%BE%D1%88%D0%B5%D0%BB%D1%8C%D0%BA%D0%B0)
 2. [Команды валидатора](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B2%D0%B0%D0%BB%D0%B8%D0%B4%D0%B0%D1%82%D0%BE%D1%80%D0%B0)
 3. [Команды голосования](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B3%D0%BE%D0%BB%D0%BE%D1%81%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
 4. [Команды настроек сети](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BA-%D1%81%D0%B5%D1%82%D0%B8)
 
 
##### Команды аккаунта (кошелька)

Cоздать кошелек

```
$binary keys add <имя_кошелька> --keyring-backend os
```

Восстановить кошелек (после команды вставить seed)

```
$binary keys add <имя_кошелька> --recover --keyring-backend os
```

Подключить кошелек ledger

```
$binary keys add <имя_кошелька> --ledger 
```

Проверить баланс

```
$binary keys q bank balances <адрес_кошелька>
```

Отправить 1 токен на другой адрес

```
$binary tx bank send <адрес_кошелька_отправителя> <адрес_кошелька_получателя> 1000000$denom --fees 500$denom -y
```

[К основному списку](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B4%D0%BB%D1%8F-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%BD%D0%BE%D0%B9-%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BA%D0%B8-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%BE%D0%B2-%D1%8D%D0%BA%D0%BE%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B-cosmos-sdk) .

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).

##### Команды валидатора

Создать валидатора

```
$binary tx staking create-validator --chain-id <chain> --commission-rate 0.05 --commission-max-rate 0.2 --commission-max-change-rate 0.1 --min-self-delegation "1000000" dermint show-validator) --moniker "<имя_ноды>" --from <адрес_кошелька> --fees 5555$denom
```

Проверить pubkey валидатора

```
$binary tendermint show-validator
```

Проверить валидатора

```
$binary query staking validator <valoper_address>
```

```
$binary query staking validators --limit 1000000 -o json | jq '.validators[] | select(.description.moniker=="<имя_ноды>")' | jq
```
  
Собрать комиссионные + реварды

```
$binary tx distribution withdraw-rewards <valoper_address> --from <адрес_кошелька> --fees 500$denom --commission -y
```

Заделегировать себе  1 токен (1 токен = 1 000 000 uтокена)

```
$binary tx staking delegate <valoper_address> 1000000$denom --from <адрес_кошелька> --fees 500$denom -y
```

[К основному списку](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B4%D0%BB%D1%8F-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%BD%D0%BE%D0%B9-%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BA%D0%B8-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%BE%D0%B2-%D1%8D%D0%BA%D0%BE%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B-cosmos-sdk) .

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).
  
##### Команды голосования
  
Список предложений

```
$binary q gov proposals
```
  
Посмотреть результат голосования

```
$binary q gov proposals --voter <адрес_кошелька>
```
  
Проголосовать за предложение 

```
$binary tx gov vote 1 yes --from <адрес_кошелька> --fees 555$denom
```
  
Внести депозит в предложение

```
$binary tx gov deposit 1 1000000utori --from <адрес_кошелька> --fees 555$denom
```

Создать предложение

```
$binary tx gov submit-proposal --title="Randomly reward" --description="Reward 10 testnet participants who completed more than 3 tasks" --type="Text" --deposit="11000000$denom" --from <адрес_кошелька> --fees 500$denom
```
  
[К основному списку](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B4%D0%BB%D1%8F-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%BD%D0%BE%D0%B9-%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BA%D0%B8-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%BE%D0%B2-%D1%8D%D0%BA%D0%BE%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B-cosmos-sdk) .

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).  
  
##### Команды настроек сети
  
Параметры сети

```
$binary q staking params
```

```
$binary q slashing params
```

Выбраться из тюрьмы

```
$binary tx slashing unjail --from <адрес_кошелька> --fees 500$denom -y
```

Проверить статус

```
curl localhost:26657/status
```

[К основному списку](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D1%8B-%D0%B4%D0%BB%D1%8F-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%BD%D0%BE%D0%B9-%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BA%D0%B8-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%BE%D0%B2-%D1%8D%D0%BA%D0%BE%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B-cosmos-sdk) .

[К началу](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/Guide_RU.md#%D1%81%D0%BE%D0%B4%D0%B5%D1%80%D0%B6%D0%B0%D0%BD%D0%B8%D0%B5).
