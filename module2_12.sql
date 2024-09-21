--Напишите запрос соединяющий таблицу orders и subscriptions
SELECT
    *
FROM
    magazine.orders as o
INNER JOIN
    magazine.subscriptions as s
	ON o.subscription_id = s.subscription_id;

--Дополните предыдущий запрос, и выведите только ту информацию, которая относится к подписке на журнал с названием "Fashion Magazine"
SELECT
    *
FROM
    magazine.orders as o
INNER JOIN
    magazine.subscriptions as s
	ON o.subscription_id = s.subscription_id
WHERE s.description = 'Fashion Magazine';

--Напишите запрос, который выведет cтолбцы desription (название журнала), price_per_month (цену подписки за месяц)
-- при условии, что длительность подписки = 1 год
SELECT
    s.description,
	s.price_per_month
FROM 
    magazine.subscriptions as s
INNER JOIN
    magazine.orders as o
	ON o.subscription_id = s.subscription_id
WHERE 
    subscription_length = '12 months';

--Напишите запрос, который посчитает количество подписчиков на печатные издания
SELECT
    COUNT(*) AS print_subscribers_count
FROM 
    magazine.newspaper as n;

--Напишите запрос, который посчитает количество подписчиков на онлайн издания
SELECT
    COUNT(*) AS online_subscribers_count
FROM 
    magazine.online as o;


--Напишите запрос, который найдет количество подписчиков, которые покупают печатные издания и онлайн издания
SELECT
    COUNT(*) as print_online_subscribers_count
FROM 
    magazine.online as o
INNER JOIN
    magazine.newspaper as n
	ON o.id = n.id;