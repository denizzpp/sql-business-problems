/*
Project: Sales Quota Progress with Running Totals

Objective:
Track each sales employee's cumulative revenue over time
and calculate their progress toward their assigned sales quota.

SQL Concepts:
- Common Table Expressions (CTEs)
- Window functions
- SUM OVER
- PARTITION BY
- JOIN
- CAST
*/

WITH sales_running_total AS (
    SELECT
        s.salesemployeeid,
        s.saledate,
        s.saleamount,
        e.quota,
        SUM(s.saleamount) OVER (
            PARTITION BY s.salesemployeeid
            ORDER BY s.saledate
        ) AS running_total
    FROM sales AS s
    JOIN employees AS e
        ON s.salesemployeeid = e.employeeid
)

SELECT
    salesemployeeid,
    saledate,
    saleamount,
    quota,
    running_total,
    CAST(running_total AS FLOAT) / quota AS percent_quota
FROM sales_running_total
ORDER BY salesemployeeid, saledate;
