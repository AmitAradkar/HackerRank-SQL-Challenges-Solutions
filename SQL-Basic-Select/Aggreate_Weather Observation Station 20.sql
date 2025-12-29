/*
========================================================
Problem Name : Weather Observation Station 20
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
A median is defined as a number separating the higher half
of a data set from the lower half.

Task:
Query the median of the Northern Latitudes (LAT_N) from
the STATION table and round the result to 4 decimal places.

========================================================
*/

SELECT 
    ROUND(AVG(LAT_N), 4) AS median
FROM (
    SELECT 
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
        COUNT(*) OVER () AS cnt
    FROM STATION
) t
WHERE rn IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2));

or 

SELECT 
    ROUND(AVG(LAT_N), 4) AS median
FROM (
    SELECT LAT_N
    FROM STATION
    ORDER BY LAT_N
    LIMIT 2 - (SELECT COUNT(*) FROM STATION) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM STATION)
) t;

