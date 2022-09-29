## Creation and installation of a bot for Telegram

### Create a bot

* Open **Telegram** and access your account https://t.me/BotFather :

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190222160-18e26c45-5f4f-4165-a2ae-59ca2365ed98.png" width=30% </p>

* Type `/newbot` in the chat, then enter the **name** of the bot and create its **address** `(required _bot at the end of the address)`.
* After successful creation, you will receive a message with the **address** of the bot and its **token**:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/193104762-04eb849b-9339-4234-be12-8ae07924249b.png" width=50% </p>

**Save the token and DO NOT publish it.**

### Bot setup

* Go to the created bot and click `Run`:
  
<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190224402-ee562f1a-a10c-4093-bad0-06655a1cfdec.png" width=50% </p>

* Specify your bot **token** in `deploy.yml`:
```
- "TOKEN=56-------3:XXXXXXXXXXXXXXXXXXXXXXXXFyVAZ-uZcA1OO-wXE"
```
<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190231394-3208b9a0-3313-485f-86af-3e949bce93db.png" width=50% </p>

* After syncing the node, send a message to the `/start` bot
