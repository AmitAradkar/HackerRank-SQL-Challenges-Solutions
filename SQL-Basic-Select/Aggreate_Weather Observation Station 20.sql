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
    ROUND(MEDIAN(LAT_N), 4) AS median_lat
FROM STATION;
