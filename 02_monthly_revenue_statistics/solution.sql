/*
Project: Monthly Revenue Descriptive Statistics

Objective:
Calculate descriptive statistics for monthly revenue by product
during 2022 to evaluate both revenue performance and variability.

SQL Concepts:
- Common Table Expressions (CTEs)
- JOIN
- DATE_TRUNC
- Aggregate functions
- GROUP BY
*/

WITH monthly_revenue AS (
    SELECT
        p.productname,
        DATE_TRUNC('month', s.orderdate) AS revenue_month,
        SUM(s.revenue) AS monthly_revenue
    FROM subscriptions AS s
    JOIN products AS p
        ON s.productid = p.productid
    WHERE s.orderdate BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY
        p.productname,
        DATE_TRUNC('month', s.orderdate)
)

SELECT
    productname,
    MIN(monthly_revenue) AS min_rev,
    MAX(monthly_revenue) AS max_rev,
    AVG(monthly_revenue) AS avg_rev,
    STDDEV(monthly_revenue) AS std_dev_rev
FROM monthly_revenue
GROUP BY productname;
