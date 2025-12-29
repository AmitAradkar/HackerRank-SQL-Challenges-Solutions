/*
========================================================
Problem Name : Weather Observation Station 19
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
Query the Euclidean Distance between points P1 and P2
and format the result to display 4 decimal places.

Euclidean Distance Formula:
sqrt( (a - c)^2 + (b - d)^2 )

========================================================
*/

SELECT 
    ROUND(
        SQRT(
            POWER(MIN(LAT_N) - MAX(LAT_N), 2) +
            POWER(MIN(LONG_W) - MAX(LONG_W), 2)
        ),
        4
    ) AS euclidean_distance
FROM STATION;
