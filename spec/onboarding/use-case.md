# Онбординг

Пользователи:
- Заказчик

Описание:  
При входе в систему заказчик должен пройти онбординг с чат-ботом для выяснения базовых общих параметров проекта. После этого ему будет предложено составить требования с ответственным разработчиком-менеджером.

Триггер:  
Заказчик первый раз входит в систему.

Предварительные условия:  
- Пользователь не авторизован и первый раз заходит в систему.

Стандартный сценарий:  
**1.0 Онбординг нового пользователя**  
1. Чат-бот приветствует пользователя и уточняет как к нему можно обращаться.
2. Чат-бот просит кратко описать проект и проблему, которую он решает.
3. Чат-бот уточняет какие типы проекта его интересуют:
    - Веб приложение
    - Мобильное приложение
    - Настольное приложение
4. Чат-бот просит придумать название для проекта.
4. Чат-бот предлагает оставить контакт для связи с разработчиком-менеджером и описывает дальнейшие шаги по разработке проекта:
    - Составление бизнес-требований
    - Составление пользовательских требований
    - Составление спецификации требований к программному обеспечению
    - Разработка дизайна
    - Разработка программного обеспечения
    - Дистрибуция проекта