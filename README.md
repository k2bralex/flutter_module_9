# flutter_module_9

Flutter working with forms. JSON. HTTP request.

## Getting Started

Используя библиотеки json_serializable и build_runner, получить данные с сервера.
Создать приложения для просмотра отелей и детальной информаци по ним.

- Получить список отелей
- При загрузке отобразите прелоадер. Карточки с отелями могут отображаться в виде списка и плитки. Для переключения вида
  в AppBar есть две иконки (список и плитка).
- При клике на кнопку «Подробнее» настройте переход на страницу с детальной информацией об отеле. На ней должен
  присутствовать slider carousel и поля: страна, город, улица, рейтинг, сервисы (платные и бесплатные).
- Создать классы и использовать json_serializable для работы с отелями и вложенными данными отелей.
- Обработать ошибки сервера: если информация об отеле недоступна, возвращайте код ошибки 404 и message. Сообщение с
  ошибкой отобразите на экране.
