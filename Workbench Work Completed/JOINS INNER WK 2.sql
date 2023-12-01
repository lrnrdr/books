-- Which countries speak Dutch?
SELECT countries.name
FROM countries
JOIN languages
ON countries.id = languages.country_id
WHERE languages.language = 'Dutch';

-- List all of the cities in Belgium.
SELECT cities.name
FROM countries
JOIN cities 
ON cities.country_id = countries.id
WHERE countries.name = 'Belgium';


-- Which languages are spoken in the United States?
SELECT countries.name, languages.language
FROM countries
JOIN languages
ON languages.country_id = countries.id
WHERE countries.name = "United States";

-- In which cities is Turkmenian spoken?
SELECT countries.name, cities.name, languages.language
FROM cities
JOIN countries
ON countries.id = cities.country_id
JOIN languages
ON countries.id = languages.country_id
WHERE languages.language = 'Turkmenian';
