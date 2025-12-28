/*
========================================================
Problem Name : Weather Observation Station 2
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
Query the following values from the STATION table:

1. The sum of all values in LAT_N, rounded to 2 decimal places.
2. The sum of all values in LONG_W, rounded to 2 decimal places.

Output Format:
lat lon

Where:
- lat  = sum of LAT_N rounded to 2 decimal places
- lon  = sum of LONG_W rounded to 2 decimal places
========================================================
*/

SELECT 
    ROUND(SUM(LAT_N), 2) AS lat,
    ROUND(SUM(LONG_W), 2) AS lon
FROM STATION;
