
/*
----------------------------------------------------
Problem: Query the total population of all cities
         where District is California
Platform: HackerRank (SQL - Basic Select)
Table   : CITY
----------------------------------------------------

Table Structure:
CITY
- ID
- NAME
- COUNTRYCODE
- DISTRICT
- POPULATION

----------------------------------------------------
Expected Output:
- A single integer value representing the total
  population of all cities in California
----------------------------------------------------
*/

SELECT SUM(POPULATION) AS total_population
FROM CITY
WHERE DISTRICT = 'California';
