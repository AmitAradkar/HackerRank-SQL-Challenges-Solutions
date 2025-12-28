/*
Problem: Triangle Types
Platform: HackerRank
Table: TRIANGLES
----------------------------------
Columns:
A INT
B INT
C INT

Output:
Equilateral
Isosceles
Scalene
Not A Triangle
*/

SELECT
    CASE
        -- Triangle inequality rule
        WHEN A + B <= C OR A + C <= B OR B + C <= A
            THEN 'Not A Triangle'

        -- All sides equal
        WHEN A = B AND B = C
            THEN 'Equilateral'

        -- Any two sides equal
        WHEN A = B OR B = C OR A = C
            THEN 'Isosceles'

        -- All sides different
        ELSE 'Scalene'
    END AS TriangleType
FROM TRIANGLES;
