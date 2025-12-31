/*
----------------------------------------------------
Problem : Symmetric Pairs
Task    : Output all symmetric pairs (X, Y) such that
          (Y, X) also exists in the table.

Rules:
- Print each symmetric pair only once
- Include (X, X) only if it appears more than once
- Output rows where X <= Y
- Order results by X ascending

Platform: HackerRank
Table   : Functions
----------------------------------------------------
*/

SELECT X, Y
FROM FUNCTIONS F1
WHERE EXISTS (
        SELECT *
        FROM FUNCTIONS F2
        WHERE F2.Y = F1.X
          AND F2.X = F1.Y
          AND F2.X > F1.X
     )
  AND X != Y

UNION

SELECT X, Y
FROM FUNCTIONS F1
WHERE X = Y
  AND (
        SELECT COUNT(*)
        FROM FUNCTIONS
        WHERE X = F1.X
          AND Y = F1.X
      ) > 1

ORDER BY X;

