/*
========================================================
Problem Name : Weather Observation Station 13
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
Query the sum of Northern Latitudes (LAT_N) from the STATION
table where LAT_N is:

    - greater than 38.7880
    - less than 137.2345

Truncate the result to 4 decimal places.

========================================================
*/

SELECT 
    TRUNCATE(SUM(LAT_N), 4) AS lat
FROM STATION
WHERE LAT_N > 38.7880
  AND LAT_N < 137.2345;
