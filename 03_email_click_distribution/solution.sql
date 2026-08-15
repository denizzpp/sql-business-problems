/*
Project: Email Click Distribution Analysis

Objective:
Analyze the distribution of email campaign link clicks by determining
how many users clicked the link once, twice, three times, and so on.

SQL Concepts:
- Common Table Expressions (CTEs)
- Filtering
- Aggregate functions
- GROUP BY
- ORDER BY
*/

WITH clicks_per_user AS (
    SELECT
        userid,
        COUNT(*) AS num_link_clicks
    FROM frontendeventlog
    WHERE eventid = 5
    GROUP BY userid
)

SELECT
    num_link_clicks,
    COUNT(*) AS num_users
FROM clicks_per_user
GROUP BY num_link_clicks
ORDER BY num_link_clicks;
