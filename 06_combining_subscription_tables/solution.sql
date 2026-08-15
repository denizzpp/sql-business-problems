/*
Project: Combining Subscription Tables

Objective:
Combine active subscriptions from two product tables and calculate
the number of subscriptions scheduled to expire in each year.

SQL Concepts:
- Common Table Expressions (CTEs)
- UNION ALL
- Filtering
- DATE_TRUNC
- Aggregate functions
- GROUP BY
*/

WITH all_subscriptions AS (
    SELECT
        subscriptionid,
        expirationdate
    FROM subscriptionsproduct1
    WHERE active = 1

    UNION ALL

    SELECT
        subscriptionid,
        expirationdate
    FROM subscriptionsproduct2
    WHERE active = 1
)

SELECT
    DATE_TRUNC('year', expirationdate) AS expiration_year,
    COUNT(*) AS subscriptions
FROM all_subscriptions
GROUP BY DATE_TRUNC('year', expirationdate)
ORDER BY expiration_year;
