/*
----------------------------------------------------
Problem : Challenges Created by Hackers
Task    : Print hacker_id, name, and total number of
          challenges created by each student.

Rules:
- Sort by total challenges DESC
- If tie, sort by hacker_id ASC
- If multiple hackers have the same challenge count
  AND that count is NOT the maximum, exclude them
- Only include:
    1) Hackers with the maximum challenge count
    2) Hackers with a unique (non-duplicate) challenge count

Platform: HackerRank (SQL - Aggregation)
Tables  : Hackers, Challenges
----------------------------------------------------

Table Structures:

Hackers
- hacker_id
- name

Challenges
- challenge_id
- hacker_id

----------------------------------------------------
Expected Output:
- hacker_id
- name
- total number of challenges created
----------------------------------------------------
*/

SELECT
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS total_challenges
FROM Hackers h
JOIN Challenges c
    ON h.hacker_id = c.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(c.challenge_id) = (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        ) max_count
    )
    OR
    COUNT(c.challenge_id) IN (
        SELECT cnt
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Challenges
            GROUP BY hacker_id
        ) challenge_counts
        GROUP BY cnt
        HAVING COUNT(cnt) = 1
    )
ORDER BY
    total_challenges DESC,
    h.hacker_id ASC;
