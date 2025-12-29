/*
========================================================
Problem Name : Population Census
Platform     : HackerRank
Category     : SQL - Basic Select
========================================================

Problem Statement:
Query a count of the number of cities in the CITY table
having a population larger than 100000.

========================================================
*/

SELECT 
    COUNT(*) AS city_count
FROM CITY
WHERE POPULATION > 100000;
