# Создание priv_validator_key.json

Так как, ноды экосистемы **Cosmos SDK** стандартизированны - то и файл `priv_validator_key.json` будет подходить к проектам Cosmos.

Если у вас еще нет этого файла - разверните через **Cloudmos** ([инструкция и пример использования здесь](https://github.com/Dimokus88/guides/blob/main/Akashlytics/RU-guide.md)) этот [deploy.yaml](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/valkey/deploy.yml) .

- После окончания развертывания, в вкладке `LOG-LOG` скопируйте вывод между полями `===CUT HERE===` в текстовый файл на ваше локальное устройство:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187510333-291e1df8-85dc-492f-8a0a-36000354d857.png" width=60% </p>

Возможно, у вас скопируется `app:` что является лишним в файле. Приведите содержимое файла к виду:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187510935-d52ba819-e3f7-4711-846f-fdd2d16faf84.png" width=60% </p>

Сохраните файл под именем `priv_validator_key.json` , теперь вы его можете использовать для любых нод экосистемы **Cosmos SDK** .

Закройте деплоймент, `5 АКТ` вернутся на счет:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187511436-c7628eb1-68d2-4018-891b-cf8ca11ebbed.png" width=60% </p>

# Ссылка на прямое скачивание
  
В наших инструкциях, мы используем ссылки на прямое скачивание из **Google диска**, как создать такую ссылку прочитайте далее.

Разместите ваш файл на **Google диск** и откройте к нему доступ на чтение, скопируйте ссылку:
  
<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187521534-69d42b1d-c940-4710-aa16-cd921db5834a.png" width=60% </p>

Моя ссылка имеет вид:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187514481-44164557-ea9a-43be-b5ed-0a9fa465bda1.png" width=110% </p>
  
Я выделил чать с **ID файла**, с копируйте ее и вставьте после `https://drive.google.com/uc?export=download&id=`, таким образом получится ссылка подобная моей:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187520568-c43a74e4-def5-4cc9-af87-6e234de182c8.png" width=110% </p>
  
Откройте ссылку в браузере, в режиме инкогнито, если файл сразу скачался - значит вы сделали все правильно!


