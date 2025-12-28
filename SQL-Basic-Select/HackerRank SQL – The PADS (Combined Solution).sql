/* =========================================================
   HackerRank SQL - The PADS
   Table: OCCUPATIONS
   ========================================================= */

/* ---------------------------------------------------------
   Query 1:
   List all names in alphabetical order,
   followed by the first letter of occupation in parentheses
   --------------------------------------------------------- */

SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS formatted_name
FROM OCCUPATIONS
ORDER BY Name;


/* ---------------------------------------------------------
   Query 2:
   Count occurrences of each occupation
   Output format:
   There are a total of [count] [occupation]s.
   Sorted by count ASC, then occupation ASC
   --------------------------------------------------------- */

SELECT CONCAT(
           'There are a total of ',
           COUNT(*),
           ' ',
           LOWER(Occupation),
           's.'
       ) AS occupation_count
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;
