/*
----------------------------------------------------
Problem : Interviews (Contest Statistics Aggregation)
Task    : Print contest_id, hacker_id, name, and the
          sums of:
          - total_submissions
          - total_accepted_submissions
          - total_views
          - total_unique_views

Rules:
- Aggregate statistics at contest level
- A contest may be used by multiple colleges
- Each college can have multiple challenges
- Exclude contests where all four sums are 0
- Sort output by contest_id (ascending)

Platform: HackerRank (SQL - Advanced Join)
Tables  :
- Contests
- Colleges
- Challenges
- View_Stats
- Submission_Stats
----------------------------------------------------
*/

SELECT
    A.CONTEST_ID,
    A.HACKER_ID,
    A.NAME,
    SUM(E.TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS,
    SUM(E.TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS,
    SUM(D.TOTAL_VIEWS) AS TOTAL_VIEWS,
    SUM(D.TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
FROM CONTESTS A
LEFT JOIN COLLEGES B
    ON A.CONTEST_ID = B.CONTEST_ID
LEFT JOIN CHALLENGES C
    ON B.COLLEGE_ID = C.COLLEGE_ID
LEFT JOIN (
    SELECT
        CHALLENGE_ID,
        SUM(TOTAL_VIEWS) AS TOTAL_VIEWS,
        SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
    FROM VIEW_STATS
    GROUP BY CHALLENGE_ID
) D
    ON C.CHALLENGE_ID = D.CHALLENGE_ID
LEFT JOIN (
    SELECT
        CHALLENGE_ID,
        SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS,
        SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
    FROM SUBMISSION_STATS
    GROUP BY CHALLENGE_ID
) E
    ON C.CHALLENGE_ID = E.CHALLENGE_ID
GROUP BY
    A.CONTEST_ID,
    A.HACKER_ID,
    A.NAME
HAVING
    (TOTAL_SUBMISSIONS
   + TOTAL_ACCEPTED_SUBMISSIONS
   + TOTAL_VIEWS
   + TOTAL_UNIQUE_VIEWS) > 0
ORDER BY
    A.CONTEST_ID;
