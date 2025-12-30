/*
----------------------------------------------------
Problem: Contest Leaderboard – Full Score Hackers
Platform: HackerRank (SQL - Advanced Select / Joins)
----------------------------------------------------

Objective:
Identify hackers who achieved FULL SCORE
for MORE THAN ONE challenge.

----------------------------------------------------
Tables Used:

Hackers
- hacker_id
- name

Difficulty
- difficulty_level
- score   (maximum score for that level)

Challenges
- challenge_id
- hacker_id
- difficulty_level

Submissions
- submission_id
- hacker_id
- challenge_id
- score

----------------------------------------------------
Conditions:
1. A full score means:
   submission.score = difficulty.score
2. Count only distinct challenges.
3. Include hackers with full score in
   more than one challenge.
4. Order results by:
   - Number of full-score challenges (DESC)
   - hacker_id (ASC)

----------------------------------------------------
Expected Output:
- hacker_id
- name
----------------------------------------------------
*/

SELECT
    h.hacker_id,
    h.name
FROM Hackers h
JOIN Submissions s
    ON h.hacker_id = s.hacker_id
JOIN Challenges c
    ON s.challenge_id = c.challenge_id
JOIN Difficulty d
    ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(DISTINCT s.challenge_id) > 1
ORDER BY
    COUNT(DISTINCT s.challenge_id) DESC,
    h.hacker_id ASC;
