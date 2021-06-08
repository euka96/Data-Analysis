DESC city;
SELECT * FROM city LIMIT 20;
SELECT * FROM city WHERE countrycode = 'KOR';
SELECT * FROM city WHERE district = 'Kyonggi';
SELECT * FROM city WHERE countrycode = 'KOR' and district = 'Kyonggi'

-- SELECT (field name) or (* FROM table name)
--     WHERE | = if
--     ORDER BY field name [DESC]
--     LIMIT numbers, offset, etc | head()
--     GROUP BY field name
--     HAVING | group if
--     JOIN table name | 합집합
--     ON field name | using with JOIN

SELECT * FROM city WHERE district = 'Kyonggi' and population > 500000;
SELECT distinct district FROM city WHERE countrycode = 'KOR';		# distinct | 중복제거
SELECT * FROM city
	WHERE district LIKE 'Chung%';	# LIKE 'n%' | n%으로 시작하는 element
SELECT * FROM city
	WHERE countrycode = 'KOR' and population between 1000000 and 2000000;


SELECT * FROM city
	WHERE countrycode = 'KOR' and population > 1000000
	ORDER BY population desc;
	
SELECT * FROM city
	WHERE countrycode = 'KOR'
	ORDER BY population desc LIMIT 10;
	
SELECT * FROM city
	WHERE countrycode = 'KOR'
	ORDER BY district, population;


SELECT COUNT(*) FROM city WHERE countrycode = 'KOR'; # COUNT(*) | 행의 개수를 다 더함
SELECT COUNT(*), SUM(population) FROM city WHERE countrycode = 'KOR';
SELECT COUNT(*), SUM(population), AVG(population) FROM city WHERE countrycode = 'KOR';


SELECT district, COUNT(*), SUM(population), AVG(population) FROM city 
	WHERE countrycode = 'KOR'
	GROUP BY district;
	
SELECT district, COUNT(*), SUM(population), AVG(population) FROM city
	WHERE countrycode = 'KOR'
	GROUP BY district 
	HAVING COUNT(*) != 1;
	
SELECT district, COUNT(*), SUM(population), AVG(population) FROM city 
	WHERE countrycode = 'KOR'
	GROUP BY district 
	HAVING COUNT(*) != 1 
	ORDER BY AVG(population) desc;
	

DESC country;

SELECT city.name, city.Population, country.Name FROM city
	JOIN country ON city.CountryCode = country.Code
	WHERE city.CountryCode = 'KOR';
	
SELECT city.name, city.Population, country.Name FROM city
	JOIN country ON city.CountryCode = country.Code
	WHERE city.Population > 9000000;
	
SELECT country.Continent, COUNT(*), AVG(city.Population) FROM city
	JOIN country ON city.CountryCode = country.Code
	GROUP BY country.Continent;

SELECT country.Continent, COUNT(*), AVG(city.Population) FROM city
	JOIN country ON city.CountryCode = country.Code
	GROUP BY country.Continent
	ORDER BY AVG(city.Population) desc;
	

SELECT r.Continent, COUNT(*), AVG(l.Population) FROM city AS l	# AS | 치환해줌, 일반적으로 Left, Right로 많이 사용
	JOIN country AS r ON l.CountryCode = r.Code
	GROUP BY r.Continent
	ORDER BY AVG(l.Population) desc;
	
SELECT r.Continent, COUNT(*), round(AVG(l.Population), 2) FROM city AS l	# AS | 치환해줌, 일반적으로 Left, Right로 많이 사용
	JOIN country AS r ON l.CountryCode = r.Code
	GROUP BY r.Continent
	ORDER BY AVG(l.Population) desc;

UPDATE city SET population = 870000, `Name` = 'Seongnam'
	WHERE city.id = 2338;
SELECT * FROM city WHERE id = 2338;

INSERT INTO city(`Name`, CountryCode, district, population)
	VALUES('Gimpo', 'KOR', 'Kyonggi', '100000');
SELECT * FROM city WHERE `Name` = 'Gimpo';

DELETE FROM city WHERE id = 4080;
SELECT * FROM city WHERE district = 'Kyonggi';


CREATE TABLE city2 LIKE city;
DESC city2;
SELECT * FROM city2;
INSERT INTO city2 SELECT * FROM city WHERE countrycode = 'KOR';
SELECT * FROM city2;

CREATE VIEW metropolitan AS SELECT * FROM city
	WHERE population > 7000000 WITH CHECK OPTION;
SELECT * FROM metropolitan;


DESC countrylanguage;
SELECT * FROM countrylanguage AS cl WHERE countrycode = 'IND';