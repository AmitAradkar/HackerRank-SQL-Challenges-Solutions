/*
----------------------------------------------------
Problem : Students and Grades Report
Task    : Generate a report containing Name, Grade, and Marks.
          - Do NOT display names of students who received a grade lower than 8
          - For grades 8–10, display student names
          - For grades 1–7, display NULL as name
          - Order results by:
              1) Grade in descending order
              2) For grades 8–10 → Name in alphabetical order
              3) For grades 1–7 → Marks in ascending order
Platform: HackerRank (SQL - Basic Join)
Tables  : Students, Grades
----------------------------------------------------

Table Structures:

Students
- ID
- Name
- Marks

Grades
- Grade
- Min_Mark
- Max_Mark

----------------------------------------------------
Expected Output:
- Name (or NULL), Grade, Marks
- Sorted according to the rules mentioned above
----------------------------------------------------
*/

SELECT
    CASE
        WHEN g.grade < 8 THEN NULL
        ELSE s.name
    END AS name,
    g.grade,
    s.marks
FROM Students s
JOIN Grades g
    ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY
    g.grade DESC,
    CASE
        WHEN g.grade >= 8 THEN s.name
        ELSE s.marks
    END ASC;
