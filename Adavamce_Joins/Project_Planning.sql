/*
----------------------------------------------------
Problem : Project Planning
Task    : Identify different projects based on
          consecutive task end dates and output
          the start and end date of each project.

Rules:
- Each task lasts exactly 1 day
- If End_Date values are consecutive,
  tasks belong to the same project
- Output:
    project_start_date, project_end_date
- Sort by:
    1) Project duration (ascending)
    2) Project start date (ascending, if tie)

Platform: HackerRank (SQL - Window Functions)
Table   : Projects
----------------------------------------------------

Table Structure:

Projects
- Task_ID
- Start_Date
- End_Date

----------------------------------------------------
Expected Output:
- Start_Date of project
- End_Date of project
----------------------------------------------------
*/

SELECT
    MIN(Start_Date) AS project_start_date,
    MAX(End_Date)   AS project_end_date
FROM (
    SELECT
        Start_Date,
        End_Date,
        DATE_SUB(Start_Date,
                 INTERVAL ROW_NUMBER() OVER (ORDER BY Start_Date) DAY) AS grp
    FROM Projects
) t
GROUP BY grp
ORDER BY
    DATEDIFF(project_end_date, project_start_date),
    project_start_date;
