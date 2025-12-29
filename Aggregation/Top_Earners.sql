/*
========================================================
Problem Name : Earnings of Employees
Platform     : HackerRank
Category     : SQL - Aggregation
========================================================

Problem Statement:
An employee's total earnings are calculated as:

    total_earnings = months * salary

Task:
1. Find the maximum total earnings among all employees.
2. Find how many employees have this maximum total earnings.
3. Print both values as space-separated integers.

========================================================
*/

SELECT 
    (months * salary) AS max_earnings,
    COUNT(*) AS employee_count
FROM Employee
GROUP BY (months * salary)
ORDER BY max_earnings DESC
LIMIT 1;
