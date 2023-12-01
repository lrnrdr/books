-- SUBQUERIES

-- sub query in WHERE
-- Select all countries where the gnp is greater than the average gnp.

SELECT name, gnp
FROM countries
WHERE gnp > 
  (SELECT AVG(gnp)
  FROM countries);
  
  
-- Running just the sub query part to see the difference you get the AVGgnp= 122,823 which
-- is why the above query shows results greater than 122,823
SELECT AVG(gnp)
FROM countries;

-- sub query using (SELECT)
-- compare each country's population with the average population of all countries.
-- We want to include the name of the country, its population, and the average population in each row.
--  Let's limit our results to 5.  (see next example below showing just the subquery only) 

SELECT countries.name, countries.population,   
  (SELECT AVG(countries.population) FROM countries)
FROM countries
LIMIT 5;

-- Running just the sub query to see what the Avg country population is , I REMOVED PERTENSIS
-- answer came out to 25,434,098 so the above example will be compared to this number

SELECT AVG(countries.population) FROM countries;
  
  -- subquery using SELECT in place of using JOIN
  -- List the number of languages associated with each country ordered from highest to lowest.
  -- Subqueries in the SELECT clause can also be used as an alternative to performing a join
  
  SELECT countries.name,
  (SELECT COUNT(*)
   FROM languages
   WHERE countries.id = languages.country_id) AS lang_num
FROM countries
ORDER by lang_num DESC;

-- Sub query using (FROM)
-- We want to know the average value of the number of countries per region
--  This requires taking an aggregate(average) of an aggregate (count). 
-- The subquery will first calculate the count of each country per region. 
-- The outer query will then find the average of that result.
-- Note that we are required to provide an alias for the subquery. In this case, we used "sub."

SELECT AVG(num_countries)
FROM
  (SELECT COUNT(*) AS num_countries
  FROM countries
  GROUP BY region) AS sub;


