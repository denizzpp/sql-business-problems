/*
Project: Employee-Manager Self Join Analysis

Objective:
Create a contact list for Sales employees by connecting each employee
with their manager and selecting the appropriate contact email.

SQL Concepts:
- Self joins
- LEFT JOIN
- COALESCE
- Table aliases
- Filtering
- NULL handling
*/

SELECT
    e.employeeid,
    e.name AS employee_name,
    m.name AS manager_name,
    COALESCE(m.email, e.email) AS contact_email
FROM employees AS e
LEFT JOIN employees AS m
    ON e.managerid = m.employeeid
WHERE e.department = 'Sales';
