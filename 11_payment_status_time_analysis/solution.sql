/*
Project: Payment Status Time Analysis

Objective:
Analyze a subscription's payment journey by calculating
the time spent in each payment status before moving to
the next chronological status.

SQL Concepts:
- Common Table Expressions (CTEs)
- Window functions
- LEAD
- PARTITION BY
- ORDER BY
- Timestamp calculations
*/

WITH payment_timeline AS (
    SELECT
        statusmovementid,
        subscriptionid,
        statusid,
        movementdate,
        LEAD(movementdate) OVER (
            PARTITION BY subscriptionid
            ORDER BY movementdate
        ) AS next_status_movement_date
    FROM paymentstatuslog
    WHERE subscriptionid = '38844'
)

SELECT
    statusmovementid,
    subscriptionid,
    statusid,
    movementdate,
    next_status_movement_date,
    next_status_movement_date - movementdate AS time_in_status
FROM payment_timeline
ORDER BY movementdate;
