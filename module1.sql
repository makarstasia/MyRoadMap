-- Напишите запрос, который выведет все столбцы с данными из таблицы movies
SELECT *
FROM movies;

-- Напишите запрос, который выведет название фильма, его жанр и год выпуска
SELECT 
    name,
	genre,
	year
FROM
    movies;

-- Напишите запрос, который выведет название фильма, но переименуйте столбец на Titles
SELECT 
    name as "Titles"
FROM 
    movies;

-- Напишите запрос, который выведет уникальные названия жанров
SELECT
    DISTINCT genre
FROM movies;


-- Напишите запрос, который выведет все столбцы из таблицы movies, при условии что рейтинг фильмов меньше 5
SELECT *
FROM movies
WHERE imdb_rating < 5;

--Исправьте предыдущий запрос, чтобы выводились все столбцы из таблицы movies, при условии что год выпуска больше 2014
SELECT *
FROM movies
WHERE year  > 2014;

--Напишите запрос, который выведет только названия фильмов, при условии, что у них рейтинг заполнен
SELECT 
    name
FROM movies
WHERE imdb_rating is not NULL;

--Исправьте предыдущий запрос так, чтобы выводились названия фильмов, у которых рейтинг не заполнен
SELECT 
    name
FROM movies
WHERE imdb_rating is NULL;

--Напишите запрос, который выведет все данные из таблицы movies для тех фильмов, которые были выпущены 
--в период между 1990 и 1999 годами включительно.
SELECT *
FROM movies
WHERE year BETWEEN 1990 and 1999;

--Напишите запрос, который выведет все данные из таблицы movies для тех фильмов, первая буква названия которых
--лежит в промежутке между буквами алфавита A и J. Отсортируйте результат по названию фильма в алфавитном порядке
SELECT *
FROM movies
WHERE name BETWEEN 'A' and 'J';

--Напишите запрос, который выведет все данные из таблицы movies для фильмов c жанром romance, которые были выпущены 
--в период между 1990 и 1999 годами включительно.	
SELECT *
FROM movies
WHERE 
   (genre = 'romance')
   AND 
   (year BETWEEN 1990 AND 1999);

--Напишите запрос, который выведет все данные из таблицы movies для фильмов c рейтингом больше 8, которые были выпущены 
--в период между 1970 и 1979 годами включительно.
SELECT *
FROM movies
WHERE 
   (imdb_rating > 8)
   AND 
   (year BETWEEN 1990 AND 1999);

--Напишите запрос, который выведет все данные из таблицы movies для фильмов c жанром horror, которые были выпущены 
--ранее 1985 года не включая этот год
SELECT *
FROM movies
WHERE 
   (genre = 'horror')
   AND 
   (year < 1985);

--Напишите запрос, который выведет все данные из таблицы movies для фильмов либо c жанром action, либо те, 
--которые были выпущены позже 2014 года, не включая этот год. Отсортируйте по жанру в алфавитном порядке
SELECT *
FROM movies
WHERE 
   (genre = 'action')
   OR
   (year > 2014)
ORDER BY
    genre ASC;

--Напишите запрос, который выведет все данные из таблицы movies для фильмов либо c жанром romance, 
--либо c жанром comedy. Отсортируйте результат по названию жанра в обратном алфавитному порядку
SELECT *
FROM movies
WHERE 
   (genre = 'romance')
   OR
   (genre = 'comedy')
ORDER BY
    genre DESC;

--Напишите запрос, который выведет все данные из таблицы movies о топ-3 фильмах с наибольшим рейтингом.
--Напишите запрос, который выведет все данные из таблицы movies о топ-3 фильмах с наибольшим рейтингом.
--Не включайте те фильмы, у которых рейтинг отсутствует
SELECT 
     *
FROM 
    movies
WHERE imdb_rating IS NOT NULL
ORDER BY imdb_rating ASC
LIMIT 3;

--Найдите количество девочек, которым было дано имя Lillian. Выведите год, когда было дано имя, и количество 
SELECT 
    year,
	number
FROM 
    babies
WHERE name = 'Lillian' AND gender = 'F';

--Выведите имя ребенка, пол, и количество раз, когда было дано данное имя в 1880 году.
--Отсортируйте результат по количеству по убыванию и выведите только 10 записей.
SELECT 
    name,
	gender,
	number
FROM 
    babies
WHERE year = 1880
ORDER BY number DESC
LIMIT 10;

--Выведите все данные о ресторанах с японской (Japanese) кухней с категорией цен = '$$' 
SELECT
	*
FROM
	nomnom
WHERE 
    cuisine = 'Japanese'
	AND 
	price = '$$';

--Выведите данные о ресторанах, по которым нет оценки здоровья
SELECT
	*
FROM
	nomnom
WHERE health IS NULL;

--Напишите запрос, который вывод нзвание статьи и её издателя. Отсортируйте результа по названию статьи в порядке возростания
SELECT
	title,
	publisher
FROM
	news
ORDER BY title;

--Посчитать количество записей в таблице fake_apps
SELECT COUNT(*)
FROM fake_apps;

--Посчитать количество бесплатных приложений в таблице fake_apps
SELECT COUNT(price)
FROM fake_apps
WHERE price = 0;


--Посчитайте сумму всех загрузок приложений в таблице fake_apps
SELECT SUM(downloads)
FROM fake_apps;

--Посчитайте максимальное, минимальное и среднее количество загрузок приложений в таблице fake_apps
SELECT
	MAX(downloads),
	MIN(downloads),
	AVG(downloads)
FROM
	fake_apps;

--Выведите название приложения, его цену в том виде, какая она есть и цену, округлённую до целого числа
SELECT
    name,
	price,
	ROUND(price,0)
FROM 
    fake_apps;
--Найдите среднюю цену на все приложения и результат округлите до двух знаков	
SELECT
	ROUND(AVG(price),2)
FROM 
    fake_apps;
	
--Выведите средний рейтинг кинофильмов в разбивке по годам выпуска из таблицы movies.
--Результат отсортируйте по году выпуска в порядке возростания
SELECT 
    year,
    AVG(imdb_rating)
FROM movies
GROUP BY year
ORDER BY
	year ASC;

	
--Напишите запрос, который позволяет нам посчитать количество приложений с отдельно взятой ценой у нас имеется в таблице fake_apps,
--при условии, что количество загрузок больше 20000
SELECT 
    price,
	COUNT(*)
FROM fake_apps
WHERE downloads > 20000
GROUP BY
    price;
	
--Напишите запрос, который посчитает сумму загрузок по каждой категории приложений
SELECT
    category,
	SUM(downloads)
FROM
    fake_apps
GROUP BY category;

--Напишите запрос, который посчитает нам количество названий фильмов в разбивке по рейтинге, 
--при этом рейтинг должен быть округлен до целого числа. Результат отсортируйте по округлённому рейтингу
SELECT
    ROUND(imdb_rating,0),
	COUNT(name)
FROM
    movies
GROUP BY imdb_rating;

--Напишите запрос, который найдет среднее количество загрузок приложений в разбивке в категориям,
--при этом каждая категория отображается в разбивке по цене
SELECT
    category,
	price,
	AVG(downloads)
FROM
    fake_apps
GROUP BY category, price
ORDER BY
	category ASC;

--Напишите запрос, который посчитает нам количество названий фильмов в разбивке по годам выпуска, 
--при этом каждый год будет отображается в разбивке по жанру. Выведите только те фильмы, количество которых
--больше 10 (не включая 10). Результат отсортируйте по году выпуска в порядке убывания

SELECT
     year,
	 genre,
	 COUNT(name)
FROM movies
GROUP BY year, genre
HAVING COUNT(name) > 10
ORDER BY year DESC;

