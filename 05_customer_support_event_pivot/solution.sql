/*
Project: Customer Support Event Pivot

Objective:
Create a user-level activity report by counting how many times
each user completed specific customer support events.

SQL Concepts:
- JOIN
- CASE statements
- Conditional aggregation
- SUM
- GROUP BY
- Filtering
*/

SELECT
    l.userid,
    SUM(CASE WHEN d.eventid = 1 THEN 1 ELSE 0 END) AS viewed_help_center_page,
    SUM(CASE WHEN d.eventid = 2 THEN 1 ELSE 0 END) AS clicked_faqs,
    SUM(CASE WHEN d.eventid = 3 THEN 1 ELSE 0 END) AS clicked_contact_support,
    SUM(CASE WHEN d.eventid = 4 THEN 1 ELSE 0 END) AS submitted_ticket
FROM frontendeventdefinitions AS d
JOIN frontendeventlog AS l
    ON l.eventid = d.eventid
WHERE d.eventtype = 'Customer Support'
GROUP BY l.userid;
