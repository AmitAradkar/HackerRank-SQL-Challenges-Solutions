/*
========================================================
Problem Name : The Blunder
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
Samantha was asked to calculate the average monthly salary
of employees from the EMPLOYEES table.

However, due to a broken keyboard, all zeros (0) were
removed from the salary values while typing.

Task:
Calculate the difference between:
1. The actual average salary
2. The incorrect average salary (with zeros removed)

Finally, round the result UP to the nearest integer.
========================================================
*/

SELECT 
    CEIL(
        AVG(salary) - AVG(REPLACE(salary, '0', ''))
    ) AS error
FROM EMPLOYEES;
