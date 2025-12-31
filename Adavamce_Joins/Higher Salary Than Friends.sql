/*
----------------------------------------------------
Problem : Higher Salary Than Friends
Task    : Find students whose best friends received
          a higher salary offer than they did.

Rules:
- Each student has ONLY one best friend
- Compare student salary vs best friend's salary
- Output ONLY student names where:
      friend's salary > student's salary
- Order results by friend's salary (ascending)

Platform: HackerRank (SQL - Join)
Tables  : Students, Friends, Packages
----------------------------------------------------

Table Structures:

Students
- ID
- Name

Friends
- ID
- Friend_ID

Packages
- ID
- Salary

----------------------------------------------------
Expected Output:
- Student Name
- Ordered by best friend's salary (ascending)
----------------------------------------------------
*/

SELECT
    s.name
FROM Students s
JOIN Friends f
    ON s.ID = f.ID
JOIN Packages p_student
    ON s.ID = p_student.ID
JOIN Packages p_friend
    ON f.Friend_ID = p_friend.ID
WHERE
    p_friend.Salary > p_student.Salary
ORDER BY
    p_friend.Salary ASC;
