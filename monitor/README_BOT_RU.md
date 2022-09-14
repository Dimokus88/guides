## Создание и установка бота для оповещения в Telegram

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

* узнайте ваш **ID** аккаунта, например с помощью бота https://t.me/username_to_id_bot

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190224919-6167a81d-76c6-4b64-9927-6a33923cdeb7.png" width=50% </p>

* Укажите ваш **токен** и **ID** аккаунта в `deploy.yml`:
```
- "CHAT_ID=1ХХХХХХХ6"
- "TOKEN=56-------3:ХХХХХХХХХХХХХХХХFyVAZ-uZcA1OO-wXE"
```
<p align="center"><img src="https://user-images.githubusercontent.com/23629420/190231394-3208b9a0-3313-485f-86af-3e949bce93db.png" width=50% </p>

Запустите развертывание, алгоритм распознает наличие данных и запустит автоматически отправку сообщений о статусе ноды, раз в **1 час**, в **чат с вашим ботом**.
