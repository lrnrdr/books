-- MySQL Workbench Queries (Core)

-- #1 What query would you run to summarize the number of countries in each continent? 
-- The query should display the name of the continent and the number of countries. 
-- Also, the query should arrange the result by the number of countries in descending order. 

SELECT continent, COUNT(*) AS number_of_countries
FROM countries
GROUP BY continent
ORDER BY number_of_countries DESC;


-- #2 What query would you run to get all the countries that speak Greek? 
-- Your query should return the name of the country, language, and language percentage.
--  Your query should arrange the result by language percentage in descending order.

SELECT countries.name, languages.language, languages.percentage
FROM countries
JOIN languages
ON countries.id = languages.country_id
WHERE languages.language = 'Greek'
ORDER BY languages.percentage DESC;

-- 3.​ What query would you run to get all the countries with Surface Area less than 1000 OR a population greater than 100,0000,000?
-- Include the country name, surface area, and population in your results.

SELECT countries.name, countries.surface_area, countries.population
FROM countries
WHERE countries.surface_area < 1000 OR countries.population > 1000000000;

-- 4. What query would you run to get countries with a government form of “Federal Republic” with a life expectancy of less than 75 years?
-- Include the country name, form of government, and life expectancy in the results.


SELECT countries.name, countries.government_form, countries.life_expectancy
FROM countries
WHERE countries.government_form = 'Federal Republic' AND life_expectancy <75;

-- 5. What query would you run to get all the cities of Mexico inside the Veracruz district and have a population greater than 100,000?
-- The query should return the Country Name, City Name, District, and Population.

SELECT countries.name AS country_name, cities.name AS city_name, cities.district, cities.population AS city_population
FROM countries
JOIN cities ON countries.id = cities.country_id
WHERE countries.name = 'Mexico'
	AND cities.district = 'Veracruz'
	AND cities.population > 100000;
    

-- ​6. What query would you run to get all the ten cities in Brazil with the smallest population? 
-- Your query should include the country name, city name, and population. 
-- Arrange the result by population in ascending order. Limit the result to the 10 cities with the smallest population. 

SELECT countries.name AS country_name, cities.name AS city_name , cities.population AS city_population
FROM countries
JOIN cities ON countries.id = cities.country_id
WHERE countries.name = 'Brazil'
ORDER BY cities.population ASC
LIMIT 10;
    
    
    
-- #7 What query would you run to get all languages spoken greater than 10% in Monaco? Display the country name, language, and percentage.

SELECT countries.name AS country_name, languages.language, languages.percentage
FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE countries.name = 'Monaco'
AND languages.percentage >10;



