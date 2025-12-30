/*
----------------------------------------------------
Problem : Binary Tree Nodes
Task    : Determine the type of each node in a
          Binary Tree.

Node Types:
- Root  : Node whose parent (P) is NULL
- Leaf  : Node that does NOT appear as a parent
- Inner : Node that is neither Root nor Leaf

Rules:
- Output format: N <space> NodeType
- Order the result by node value (N) in ascending order

Platform: HackerRank (SQL - Case & Subquery)
Table   : BST
----------------------------------------------------

Table Structure:

BST
- N  (Node value)
- P  (Parent node value)

----------------------------------------------------
Expected Output:
- Node value
- Node type (Root / Inner / Leaf)
----------------------------------------------------
*/

SELECT
    b.N,
    CASE
        WHEN b.P IS NULL THEN 'Root'
        WHEN b.N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)
             THEN 'Leaf'
        ELSE 'Inner'
    END AS node_type
FROM BST b
ORDER BY b.N;
