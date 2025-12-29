/*
========================================================
Problem Name : Weather Observation Station 18
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
Consider two points on a 2D plane:

P1(a, b):
- a = minimum value of LAT_N in STATION
- b = minimum value of LONG_W in STATION

P2(c, d):
- c = maximum value of LAT_N in STATION
- d = maximum value of LONG_W in STATION

Task:
Query the Manhattan Distance between points P1 and P2
and round the result to 4 decimal places.

Manhattan Distance Formula:
|a - c| + |b - d|

========================================================
*/

SELECT 
    ROUND(
        ABS(MIN(LAT_N) - MAX(LAT_N)) +
        ABS(MIN(LONG_W) - MAX(LONG_W)),
        4
    ) AS manhattan_distance
FROM STATION;
