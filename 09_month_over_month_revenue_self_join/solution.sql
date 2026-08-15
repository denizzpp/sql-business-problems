/*
Project: Month-over-Month Revenue Comparison

Objective:
Identify months where total revenue increased compared with
the immediately preceding month using a self join.

SQL Concepts:
- Common Table Expressions (CTEs)
- Self joins
- DATE_TRUNC
- DATEDIFF
- Aggregate functions
- GROUP BY
*/

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', orderdate) AS order_month,
        SUM(revenue) AS monthly_revenue
    FROM subscriptions
    GROUP BY DATE_TRUNC('month', orderdate)
)

SELECT
    curr.order_month AS current_month,
    prev.order_month AS previous_month,
    curr.monthly_revenue AS current_revenue,
    prev.monthly_revenue AS previous_revenue
FROM monthly_revenue AS curr
JOIN monthly_revenue AS prev
    ON DATEDIFF('month', prev.order_month, curr.order_month) = 1
WHERE curr.monthly_revenue > prev.monthly_revenue
ORDER BY curr.order_month;
