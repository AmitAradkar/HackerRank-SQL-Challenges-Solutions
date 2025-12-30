/*
----------------------------------------------------
Problem : Contest Leaderboard (Total Score per Hacker)
Task    : Calculate the total score of each hacker.
          The total score is the SUM of the maximum
          score achieved by the hacker for each
          challenge.

Rules:
- For each (hacker_id, challenge_id), consider ONLY
  the maximum score
- Sum these maximum scores to get total score
- Exclude hackers with total score = 0
- Sort results by:
    1) total_score DESC
    2) hacker_id ASC (if scores are equal)

Platform: HackerRank (SQL - Aggregation & Subquery)
Tables  : Hackers, Submissions
----------------------------------------------------

Table Structures:

Hackers
- hacker_id
- name

Submissions
- submission_id
- hacker_id
- challenge_id
- score

----------------------------------------------------
Expected Output:
- hacker_id
- name
- total_score
----------------------------------------------------
*/

SELECT
    h.hacker_id,
    h.name,
    SUM(ms.max_score) AS total_score
FROM Hackers h
JOIN (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY
        hacker_id,
        challenge_id
) ms
    ON h.hacker_id = ms.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    SUM(ms.max_score) > 0
ORDER BY
    total_score DESC,
    h.hacker_id ASC;
