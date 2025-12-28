/*
========================================================
Problem Name : Weather Observation Station 16
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
Query the smallest Northern Latitude (LAT_N) from the
STATION table such that:

    LAT_N > 38.7780

Round the result to 4 decimal places.

========================================================
*/

SELECT 
    ROUND(MIN(LAT_N), 4) AS lat
FROM STATION
WHERE LAT_N > 38.7780;
