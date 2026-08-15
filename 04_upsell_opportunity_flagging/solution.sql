/*
Project: Upsell Opportunity Flagging

Objective:
Identify customers who represent potential upsell opportunities
based on their number of registered users or product subscriptions.

SQL Concepts:
- CASE statements
- Aggregate functions
- GROUP BY
- Conditional logic
*/

SELECT
    customerid,
    COUNT(DISTINCT productid) AS num_products,
    SUM(numberofusers) AS total_users,
    CASE
        WHEN SUM(numberofusers) >= 5000
             OR COUNT(DISTINCT productid) = 1
            THEN 1
        ELSE 0
    END AS upsell_opportunity
FROM subscriptions
GROUP BY customerid;
