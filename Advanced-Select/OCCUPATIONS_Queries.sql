/* =========================================================
   HackerRank SQL – OCCUPATIONS (Combined Solutions)
   ========================================================= */


/* ---------------------------------------------------------
   1️⃣ The PADS – Names with Occupation Initial
   --------------------------------------------------------- */

SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS Result
FROM OCCUPATIONS
ORDER BY Name;


/* ---------------------------------------------------------
   2️⃣ The PADS – Occupation Count Summary
   --------------------------------------------------------- */

SELECT CONCAT(
    'There are a total of ',
    COUNT(*),
    ' ',
    LOWER(Occupation),
    's.'
) AS Result
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;


/* ---------------------------------------------------------
   3️⃣ Pivot the Occupation
   ---------------------------------------------------------
   Columns order:
   Doctor | Professor | Singer | Actor
   --------------------------------------------------------- */

WITH ranked AS (
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
)
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM ranked
GROUP BY rn
ORDER BY rn;
