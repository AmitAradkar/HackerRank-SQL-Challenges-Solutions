/*
========================================================
Problem Name : Weather Observation Station 17
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
Query the Western Longitude (LONG_W) from the STATION table
where the Northern Latitude (LAT_N) is the smallest value
such that:

    LAT_N > 38.7780

Round the result to 4 decimal places.

========================================================
*/

SELECT 
    ROUND(LONG_W, 4) AS lon
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N > 38.7780
);
