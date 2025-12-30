/*
----------------------------------------------------
Problem : Ollivander's Inventory (Harry Potter Wands)
Task    : Find the minimum number of gold galleons needed
          to buy each non-evil wand of a given power and age.

Conditions:
- Only include non-evil wands (is_evil = 0)
- For each (power, age) combination, select the wand
  with the minimum coins_needed
- Output columns:
    id, age, coins_needed, power
- Sorting rules:
    1) power DESC
    2) age DESC (if power is same)

Platform: HackerRank (SQL - Advanced Join)
Tables  : Wands, Wands_Property
----------------------------------------------------

Table Structures:

Wands
- id
- code
- coins_needed
- power

Wands_Property
- code
- age
- is_evil

----------------------------------------------------
Expected Output:
- id, age, coins_needed, power
- Only non-evil wands
- Minimum coins_needed per power & age
----------------------------------------------------
*/

SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM Wands w
JOIN Wands_Property wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
  AND w.coins_needed = (
        SELECT MIN(w2.coins_needed)
        FROM Wands w2
        JOIN Wands_Property wp2
            ON w2.code = wp2.code
        WHERE wp2.is_evil = 0
          AND w2.power = w.power
          AND wp2.age = wp.age
    )
ORDER BY
    w.power DESC,
    wp.age DESC;
