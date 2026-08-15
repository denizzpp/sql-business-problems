/*
Project: Cancellation Reason Analysis

Objective:
Transform multiple cancellation reason columns into rows and calculate
the proportion of canceled subscriptions that selected "Expensive"
as one of their cancellation reasons.

SQL Concepts:
- Common Table Expressions (CTEs)
- UNION
- Unpivoting
- CASE
- COUNT
- COUNT DISTINCT
- CAST
*/

WITH all_cancellation_reasons AS (
    SELECT
        subscriptionid,
        cancelationreason1 AS reason
    FROM cancelations

    UNION

    SELECT
        subscriptionid,
        cancelationreason2 AS reason
    FROM cancelations

    UNION

    SELECT
        subscriptionid,
        cancelationreason3 AS reason
    FROM cancelations
)

SELECT
    CAST(
        COUNT(
            DISTINCT CASE
                WHEN reason = 'Expensive' THEN subscriptionid
            END
        ) AS FLOAT
    ) / COUNT(DISTINCT subscriptionid) AS percent_expensive
FROM all_cancellation_reasons;
