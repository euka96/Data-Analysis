# 대륙별로 국가숫자, GNP 합, GNP 평균

SELECT continent, COUNT(*), SUM(gnp), AVG(gnp) FROM country
	GROUP BY continent;

# 아시아 대륙에서 인구가 가장 많은 도시 10개 내림차순 (대륙명, 국가명, 도시명, 인구수)

SELECT country.continent, country.name AS country, city.name AS city, city.population FROM city
	JOIN country ON city.CountryCode = country.Code
	WHERE country.continent = 'Asia'
	ORDER BY city.population desc
	LIMIT 10;

# 전 세계에서 인구가 가장 많은 10개 도시에서 사용하는 공식언어 (도시명, 인구순, 언어명)

SELECT city.name AS city, city.population, countrylanguage.language FROM city
	JOIN countrylanguage ON city.CountryCode = countrylanguage.countrycode
	WHERE countrylanguage.isofficial = TRUE     # 이 조건 없으면 여러 언어를 사용하는 특정 도시만 나옴
	ORDER BY city.population desc
	LIMIT 10;