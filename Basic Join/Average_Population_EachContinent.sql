/*
----------------------------------------------------
Problem: query the names of all the continents (COUNTRY.Continent) and their respective
          average city populations (CITY.Population) rounded down to the nearest integer
Platform: HackerRank (SQL - Basic Join)
Tables  : CITY, COUNTRY
----------------------------------------------------

Table Structures:

CITY
- ID
- NAME
- COUNTRYCODE
- DISTRICT
- POPULATION

COUNTRY
- CODE
- NAME
- CONTINENT
- REGION
- SURFACEAREA
- INDEPYEAR
- POPULATION
- LIFEEXPECTANCY
- GNP
- GNPOLD
- LOCALNAME
- GOVERNMENTFORM
- HEADOFSTATE
- CAPITAL
- CODE2

----------------------------------------------------
Expected Output:
- List of city names and their respective average
city populations (CITY.Population) rounded down to the nearest integer 
----------------------------------------------------
*/

Select COUNTRY.Continent,Floor(AVG(CITY.POPULATION))
from CITY  Join COUNTRY   on CITY.CountryCode = COUNTRY.Code
group by COUNTRY.Continent
