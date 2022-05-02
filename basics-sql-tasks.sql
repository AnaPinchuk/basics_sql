-- работаем с тестовыми таблицами через app.mode.com

/* Лекция 1.
Задание 1.
Выбрать все столбцы и строки из таблицы tutorial.yammer_users */

SELECT * FROM tutorial.yammer_users;

/* Лекция 1.
Задание 2.
Выбрать столбцы user_id, company_id, created_at из таблицы */

SELECT user_id, company_id, created_at
FROM tutorial.yammer_users;

/* Лекция 1.
Задание 3.
Переделать запрос из задания 2, при том, что нужно уточнить в SELECT, 
из какой из нескольких таблиц тянуть данные*/

SELECT tutorial.yammer_users.user_id, tutorial.yammer_users.company_id, tutorial.yammer_users.created_at
FROM tutorial.yammer_users;

/* Лекция 1.
Задание 4.
Выбрать из таблицы столбцы user_id, company_id, created_at
Переименовать столбец user_id в "Номер пользователя"
Переименовать company_id в "Компания"*/

SELECT tutorial.yammer_users.user_id AS ("Номер пользователя"или user_number), 
tutorial.yammer_users.company_id AS ("Компания" или company), 
tutorial.yammer_users.created_at
FROM tutorial.yammer_users;

/* Лекция 1.
Задание 5.
Выбрать из таблицы столбцы user_id, company_id, created_at
Отсортировать результат по company_id по возрастанию, а внутри компании,
по user_id по убыванию */

SELECT user_id, company_id, created_at
FROM tutorial.yammer_users
ORDER BY company_id, user.id DESC;

/* Лекция 1.
Задание 6.
Выведите всю информацию по последним 5 зарегистрировавшимся пользователям */

SELECT * FROM tutorial.yammer_users
ORDER BY user.id DESC
LIMIT 5;

/* Лекция 1.
Задание 7.
Выбрать столбцы user_id, company_id, language, state
Переименовать user_id в номер пользователя
Переименовать language в язык
Дать названию принятый в Бусте псевдоним
Уточнить, что state мы тащим именно из таблицы нашей таблицы
Отсортировать по language по убыванию, дальше по company_id по возрастанию, 
и, наконец, по user_id по убыванию
Выбрать только первые 100 строк */

SELECT user_id AS "Номер пользователя", 
company_id , 
language AS Язык, 
t0.state
FROM tutorial.yammer_users AS t0
ORDER BY language DESC, company_id, user_id DESC
LIMIT 100;

/* Лекция 2.
Выбрать столбцы user_id, company_id, language, state
Дайте одному из столбцов произвольный псевдоним
Отсортировать по user_id по убыванию
Выбрать только первые 300 строк */

SELECT user_id
       ,company_id AS компания
       ,language
       ,state
FROM tutorial.yammer_users
ORDER BY user_id DESC
LIMIT 300;

/* Лекция 2.
Задание 1.
Выбрать user_id, language, state из tutorial.yammer_users,
где язык = английский */

SELECT user_id AS юзер
      ,language AS язык
      ,state AS штат
FROM tutorial.yammer_users
WHERE language = 'english';

/* Лекция 2.
Задание 2.
Выбрать language, company_id, state,
где user_id больше или равна 2000 */

SELECT language, company_id, state
FROM tutorial.yammer_users
WHERE user_id >= 2000;

/* Лекция 2.
Задание 3.
Выберите user_id, created_at, для первых 5 пользователей, 
зарегистрировавшихся в 2014 году */

SELECT user_id, created_at
FROM tutorial.yammer_users
WHERE created_at > '2014-01-01' and created_at < '2015-01-01'
ORDER BY created_at
LIMIT 5;

/* Лекция 2.
Задание 4.
Выберите user_id, company_id, state для пользователей
из 51й компании и со статусом pending */

SELECT user_id
, company_id
, state
FROM tutorial.yammer_users
WHERE company_id = 51 
AND state = 'pending';

/* Лекция 2.
Задание 5.
Выберите user_id, company_id, language для пользователей
у которых или 3я компания, или язык арабский (arabic) */

SELECT user_id
, company_id
, language
FROM tutorial.yammer_users
WHERE company_id = 3
OR language = 'arabic';

/* Лекция 2.
Задание 6.
Выберите все колонки для пользователей у которых
или английский язык и регистрация строго после 01 февраля 2014 года
или корейский язык */

SELECT * FROM tutorial.yammer_users
WHERE (language = 'english' AND created_at >= '2014-02-02') 
OR language = 'korean';

/* Лекция 2.
Задание 7.
Выберите всех пользователей, у которых нет информации о дате активации
и при этом статус = 'active' */

SELECT user_id
FROM tutorial.yammer_users 
WHERE actived_at is NULL AND state = 'active';

/* Лекция 2.
Задание 8.
Выберите айдишки всех пользователей из базы,
чей язык заканчивается на -ese */

SELECT user_id
FROM tutorial.yammer_users
WHERE language LIKE '%ese';

/* Лекция 2.
Задание 9.
Выберите все данные по пользователям 1927, 95, 782,
а также всем активным пользователям с айдишкой строго больше 2500 */

SELECT *
FROM tutorial.yammer_users
WHERE user_id IN (1927, 95, 782) 
OR (user_id > 2500 AND state = 'active');

/* Лекция 2.
Задание 10.
Выбрать всю инфу по пользователям, зарегистрировавшимся в марте 2014,
и при этом без активации.
Отсортуйте таблицу по компании, по убыванию */

SELECT *
FROM tutorial.yammer_users 
WHERE created_at BETWEEN '2014-03-01' AND '2014-03-31 23:59:59'
AND active IS NULL
ORDER BY company_id DESC;

/* Лекция 2.
Задание 11.
Выбрать из таблицы столбцы user_id, company_id, created_at
для пользователей у которых язык не корейский и 
компания не в промежутке с 500 по 700 включительно */

SELECT user_id
, company_id
, created_at
FROM tutorial.yammer_users
WHERE language <> 'korean' 
AND company_id NOT BETWEEN 500 AND 700;

/* Лекция 2.
Финальное задание.
Выбрать данные пользователей, где

или компания с 200 по 500 не включительно и язык не содержит букву К в начале
или язык русский и пользователь не активен
или дата регистрации до 2014 года и айди пользователя не в промежутке
от 150 до 200 включительно
или язык испанский 

Отсортировать по айди пользователя по убыванию*/

SELECT *
FROM tutorial.yammer_users
WHERE ((company_id BETWEEN 201 AND 499) AND language NOT LIKE 'k%') 
OR (language = 'russian' AND actived_at IS NULL)
OR (created_at < '2014-01-01' AND user_id NOT BETWEEN 150 AND 200)
OR language = 'spanish'
ORDER BY user_id DESC;

-- Лекция 3. Arithmetic functions

SELECT *
, account_id * 2 AS double_acc
, account_id / id AS some_bullshit
FROM tutorial.orders

/* Лекция 3.
Задание 1.
Выбрать все строки из tutorial.orders, где amount_usd строго больше 1000:
добавить колонку со словом boosta в каждую строку
добавить колонку с quantity + 15
добавить колонку с amount_usd деленным на quantity
посмотрите на названия новых колонок ради интереса, потом добавьте псевдонимы
попробуйте убрать фильтр по amount_usd и перезапустить запрос */


SELECT *
, 'boosta' AS family
, quantity + 15 AS plus_15
, amount_usd / quantity AS division
FROM tutorial.orders
WHERE amount_usd > 1000;

/* Лекция 3.
Задание 2.
Выбрать все строки из tutorial.orders (без фильтров):

добавить колонку с amount_usd деленным на quantity только если и
amount_usd и quantity больше нуля, в другом случае вывести 0
округлите получившийся результат до целых
придумайте колонке псевдоним
 */

SELECT *
, ROUND(
  CASE
   WHEN amount_usd > 0 AND quantity > 0 THEN amount_usd / quantity 
   ELSE 0
  END 
 ) AS division

FROM tutorial.orders;


/* Лекция 3.
Задание 3.
Начальство хочет заменить данные в столбце permalink:

вместо неинформативного /company писать сферу, где компания работает
сферу берем из колонки category_code, если пустая, тогда написать категорию other
чтоб всё было в одном стиле, category_code нужно сократить до трёх букв
 */

 SELECT permalink, category_code
, CASE 
     WHEN category_code IS NULL 
     THEN 'other' 
     ELSE category_code 
  END
, LEFT(
      CASE 
         WHEN category_code IS NULL 
         THEN 'other' 
         ELSE category_code 
         END
      , 3)
, SUBSTR(permalink, 9)
, CONCAT(
      '/', 
      LEFT(
            CASE 
               WHEN category_code IS NULL 
               THEN 'other' 
               ELSE category_code 
             END, 
            3), 
      SUBSTR(
            permalink, 
            9)
  ) AS new_column
FROM tutorial.crunchbase_companies;


/* Лекция 4.
Задание 1.
Вытащить из таблицы все столбцы

Создать новый столбец, где сцепить id заказа и account_id через нижнее подчёркивание

Отфильтровать таблицу только заказами, сделанными в сентябре
*/

SELECT *
, CONCAT(id, '_', account_id) AS users_order
FROM tutorial.orders
WHERE date_part('month', occurred_at) = 9;


/* Лекция 4.
Задание 2.
Из таблицы tutorial.orders узнать:

сумму денег по всем заказам;
среднюю сумму по ордеру;
минимальную и максимальную сумму по ордеру;
количество ордеров;
количество аккаунтов;


Попробовать применить LIMIT в агрегационном запросе
Добавить фильтр account_id = 1001
Попробовать добавить неагрегированный столбец (без функций, просто колонку) в запрос
*/

SELECT SUM(amount_usd) AS sum_orders
, AVG(amount_usd) AS avg_sum
, MIN(amount_usd) AS min_sum
, MAX(amount_usd) AS max_sum
, COUNT(id) AS count_orders
, COUNT(account_id) AS count_acc
FROM tutorial.orders;


/* Лекция 4.
Задание 3.
К предыдущему запросу добавьте ещё 2 столбца, где считается количество уникальных значений.
Что вы видите?
Как вы можете объяснить такие цифры?
*/

SELECT SUM(amount_usd) AS sum_orders
, AVG(amount_usd) AS avg_sum
, MIN(amount_usd) AS min_sum
, MAX(amount_usd) AS max_sum
, COUNT(id) AS count_orders
, COUNT(account_id) AS count_acc
, COUNT(DISTINCT(id)) AS count_orders
, COUNT(DISTINCT(account_id)) AS count_acc
FROM tutorial.orders;

/* Лекция 4.
Задание 4.
Из таблицы tutorial.orders
Создать столбец, вытаскивающий год из даты в occurred_at (функция date_part)
Вытащить количество уникальных заказов и сумму в деньгах для каждого юзера,
по каждому году
Отсортируйте по юзеру, потом по году
*/

SELECT date_part('year', occurred_at) AS orders_by_year
, COUNT(DISTINCT(id)) AS unique_orders
, SUM(amount_usd) AS sum_orders
FROM tutorial.orders
GROUP BY account_id, year
ORDER BY account_id, year;

/* Лекция 4.
Пример запроса Having.
С таблицей tutorial.orders
*/

SELECT account_id
, COUNT(DISTINCT(id))
, SUM(amount_usd)
FROM tutorial.orders
GROUP BY account_id, year
HAVING COUNT(DISTINCT(id)) > 10
ORDER BY account_id, year;


/* Лекция 4.
Финальное задание.

Из таблицы tutorial.orders:

исключить тестовые аккаунты с 1001 по 1022 включительно;
оставить только заказы сделанные в 2014 или в 2017 году;
интересует группировка по аккаунту и по связке год_месяц (второе поле нужно создать);
после группировки отсеять группы с 1 заказом в месяц на пользователя;
отсортируйте по аккаунту по убыванию и по год_месяц по возрастанию.

Со звёздочкой:
Как видите, сортировка работает неправильно - сначала идёт январь, потом октябрь. 
Как переделать запрос для правильной сортировки?
*/

SELECT account_id
, COUNT(DISTINCT(id))
, SUM(amount_usd)
, CONCAT(date_part('year', occurred_at), '-', date_part('month', occurred_at)) AS year_month
FROM tutorial.orders
WHERE account_id NOT BETWEEN 1001 AND 1022 
 AND date_part('year', occurred_at) IN (2014, 2017)
GROUP BY account_id, year_month
HAVING COUNT(DISTINCT(id)) <> 1
ORDER BY account_id DESC, MIN(occurred_at); 

/* Лекция 4. Домашка.

Ваш тимлид хочет узнать, есть ли в ваших продажах сезонность.
Ваши продажи записываются в таблицу tutorial.orders.

Для этого он хочет, чтобы вы посчитали средний чек (amount_usd) 
отдельно для каждого времени года. */

-- С группировкой сезонности и данными лишь по кол-ву ордеров, среднему чеку

SELECT COUNT(id)
, AVG(amount_usd)
, CASE 
 WHEN date_part('month', occurred_at) BETWEEN 01 AND 02 THEN 'winter'
 WHEN date_part('month', occurred_at) BETWEEN 03 AND 05 THEN 'spring'
 WHEN date_part('month', occurred_at) BETWEEN 06 AND 08 THEN 'summer'
 WHEN date_part('month', occurred_at) BETWEEN 09 AND 11 THEN 'autumn'
 ELSE 'winter'
END AS seasonality
FROM tutorial.orders
GROUP BY seasonality
ORDER BY MIN(occurred_at);

-- Вариант со всеми полями, без группировки + IN в date_part

SELECT *
, CASE 
 WHEN date_part('month', occurred_at) IN (01, 02, 12) THEN 'winter'
 WHEN date_part('month', occurred_at) IN (03, 04, 05) THEN 'spring'
 WHEN date_part('month', occurred_at) IN (06, 07, 08) THEN 'summer'
 ELSE 'autumn'
END AS seasonality
FROM tutorial.orders
ORDER BY min(occurred_at);

-- Вариант с указанием суммы ордера в конретный сезон

SELECT *
, CASE WHEN date_part('month', occurred_at) IN (01, 02, 12) THEN amount_usd ELSE NULL END AS winter
, CASE WHEN date_part('month', occurred_at) IN (03, 04, 05) THEN amount_usd ELSE NULL END AS spring
, CASE WHEN date_part('month', occurred_at) IN (06, 07, 08) THEN amount_usd ELSE NULL END AS summer
, CASE WHEN date_part('month', occurred_at) IN (09, 10, 11) THEN amount_usd ELSE NULL END AS autumn
FROM tutorial.orders;

-- Вариант только с данными среднего чека отдельно по каждому сезону

SELECT
AVG(CASE WHEN date_part('month', occurred_at) IN (01, 02, 12) THEN amount_usd ELSE NULL END) AS winter
, AVG(CASE WHEN date_part('month', occurred_at) IN (03, 04, 05) THEN amount_usd ELSE NULL END) AS spring
, AVG(CASE WHEN date_part('month', occurred_at) IN (06, 07, 08) THEN amount_usd ELSE NULL END) AS summer
, AVG(CASE WHEN date_part('month', occurred_at) IN (09, 10, 11) THEN amount_usd ELSE NULL END) AS autumn
FROM tutorial.orders;

-- "Идеальный" вариант запроса с сезонностью, год + средний чек с округлением

SELECT date_part('year', occurred_at) AS year
, CASE 
   WHEN date_part('month', occurred_at) IN (01, 02, 12) THEN 'winter'
   WHEN date_part('month', occurred_at) IN (03, 04, 05) THEN 'spring'
   WHEN date_part('month', occurred_at) IN (06, 07, 08) THEN 'summer'
   WHEN date_part('month', occurred_at) IN (09, 10, 11) THEN 'autumn'
   ELSE 'autumn'
  END AS seasonality
, ROUND(AVG(amount_usd)) AS avg_revenue
FROM tutorial.orders
WHERE quantity != 0 
AND date_part('year', occurred_at) NOT IN (2013, 2017)
GROUP BY year, seasonality
ORDER BY MIN(occurred_at);

-- "Идеальный" вариант запроса с сезонами как отдельными колонка + год

SELECT date_part('year', occurred_at) AS year
, ROUND(AVG(CASE WHEN date_part('month', occurred_at) IN (01, 02, 12) THEN amount_usd ELSE NULL END)) AS winter
, ROUND(AVG(CASE WHEN date_part('month', occurred_at) IN (03, 04, 05) THEN amount_usd ELSE NULL END)) AS spring
, ROUND(AVG(CASE WHEN date_part('month', occurred_at) IN (06, 07, 08) THEN amount_usd ELSE NULL END)) AS summer
, ROUND(AVG(CASE WHEN date_part('month', occurred_at) IN (09, 10, 11) THEN amount_usd ELSE NULL END)) AS autumn
FROM tutorial.orders
WHERE (date_part('year', occurred_at) <> 2013 AND date_part('year', occurred_at) <> 2017) AND amount_usd <> 0
GROUP BY year
ORDER BY year;

/* Лекция 5.
Задание 1.
Вытащить из таблицы tutorial.yammer_users все данные по user_id 10552
Присоедините все записи из tutorial.yammer_events по ключу user_id
Отфильтруйте таблицу по event_name = 'login'

Сделайте тоже самое для юзера 10500
Удивитесь
Посмотрите есть ли в базе юзер 10500
*/

SELECT * FROM tutorial.yammer_users AS t0
JOIN tutorial.yammer_events t1 
ON t0.user_id = t1.user_id
WHERE tutorial.yammer_events.user_id = 10522 
AND event_name = 'login';

/* Лекция 5.
Задание 2.
Вытащить из таблицы tutorial.yammer_users, где company_id 1111
Посчитайте количество уникальных пользователей
Присоедините все записи из tutorial.yammer_events по ключу user_id
Еще раз посчитайте количество уникальных пользователей
*/

SELECT COUNT(DISTINCT(t0.user_id))
FROM tutorial.yammer_users AS t0
JOIN tutorial.yammer_events AS t1 ON t0.user_id = t0.user_id
WHERE t1.company_id = 1111;

/* Лекция 5.
Задание 3.
Вытащить из таблицы tutorial.yammer_users количество уникальных пользователей
с company_id = 100. Запомните это число

Посмотрите есть ли в таблице tutorial.yammer_events события с пустым полем device
Присоедините tutorial.yammer_events по ключу user_id. Сгруппируйте таблицу по device 
и посмотрите на кол-во yammer_users.user_id в каждой группе.
Откуда появилась группа с пустым device? 
Почему уникальных пользователей больше, чем в оригинальной таблице?

Поменяйте таблицу подсчета - посчитайте yammer_events.user_id
Поменялись ли цифры?

Уберите группировку и подтвердите свои догадки.
*/
SELECT COUNT(DISTINCT(user_id))
FROM tutorial.yammer_users
WHERE company_id = 100;

SELECT device, COUNT(DISTINCT(t0.user_id))
FROM tutorial.yammer_users AS t0
LEFT JOIN tutorial.yammer_events AS t1
ON t0.user_id = t1.user_id
WHERE company_id = 100
GROUP BY device;

/* Лекция 5.
Задание 4.
Выберите все заказы из таблицы tutorial.orders
Добавьте информацию про покупателя из tutorial.accounts с помощью
RIGHT JOIN.

Добавьте информацию про регионы из tutorial.regions.

Выберите только строки, где контакт (primary_contact) зовут Barrie,
с любой фамилией.

Оставьте только регионы West или Northeast
*/

SELECT *
FROM tutorial.orders AS t0
RIGHT JOIN tutorial.accounts AS t1 
ON t1.id = t0.account_id
RIGHT JOIN tutorial.regions AS t2 
ON t1.region_id = t2.id
WHERE t2.name IN ('West', 'Northeast') 
AND t1.primary_contact LIKE 'Barrie%';

/* Лекция 5.
Задание 5.
Из таблиц yammer_experiments и yammer_emails одним запросом нужно понять,
сколько уникальных пользователей участвовали

1. Только в экспериментах
2. Только в рассылках
3. И в рассылках, и в экспериментах

*/

SELECT 
CASE WHEN t0.user_id IS NULL THEN 'Not in experiments' 
     WHEN t1.user_id IS NULL THEN 'Not in emails'
     ELSE 'In both' 
END AS grouping
, COUNT(DISTINCT(CASE WHEN t0.user_id IS NULL THEN t1.user_id ELSE t0.user_id END)) 
AS count_users
FROM tutorial.experiments AS t0
FULL JOIN tutorial.emails AS t1
ON t0.user_id = t1.user_id
GROUP BY grouping;