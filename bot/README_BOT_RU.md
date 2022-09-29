## Создание и установка бота для Telegram

### Создание бота

* Откройте **Telegram**  и обратитесь к аккаунту https://t.me/BotFather :

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190222160-18e26c45-5f4f-4165-a2ae-59ca2365ed98.png" width=30% </p>
![image]()

* Выполните в чате `/newbot`, затем введите **имя** бота и создайте его **адрес** `(в конце адреса обязательно _bot)`.  
* После успешного создания получите сообщение где будет указан **адрес** бота и его **токен**:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190224045-a382ca96-52ca-43b3-9813-0761a24564ea.png" width=50% </p>

**Сохраните токен и НЕ публикуйте его.**

### Настройка бота

* Прейдите в созданного бота и нажмите `Запустить`:
  
<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190224402-ee562f1a-a10c-4093-bad0-06655a1cfdec.png" width=50% </p>

* Укажите ваш **токен** бота  в `deploy.yml`:
```
- "TOKEN=56-------3:ХХХХХХХХХХХХХХХХFyVAZ-uZcA1OO-wXE"
```
<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190231394-3208b9a0-3313-485f-86af-3e949bce93db.png" width=50% </p>

