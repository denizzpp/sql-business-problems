/*
Project: Payment Funnel Analysis with Multiple CTEs

Objective:
Determine the furthest payment stage reached by each subscription
and classify subscriptions into payment funnel stages based on
their maximum status reached and current status.

SQL Concepts:
- Common Table Expressions (CTEs)
- LEFT JOIN
- CASE statements
- Aggregate functions
- GROUP BY
*/

WITH max_payment_status AS (
    SELECT
        subscriptionid,
        MAX(statusid) AS maxstatus
    FROM paymentstatuslog
    GROUP BY subscriptionid
),

payment_funnel AS (
    SELECT
        s.subscriptionid,
        m.maxstatus,
        s.currentstatus,
        CASE
            WHEN m.maxstatus = 1
                THEN 'PaymentWidgetOpened'

            WHEN m.maxstatus = 2
                THEN 'PaymentEntered'

            WHEN m.maxstatus = 3 AND s.currentstatus = 0
                THEN 'User Error with Payment Submission'

            WHEN m.maxstatus = 3 AND s.currentstatus != 0
                THEN 'Payment Submitted'

            WHEN m.maxstatus = 4 AND s.currentstatus = 0
                THEN 'Payment Processing Error with Vendor'

            WHEN m.maxstatus = 4 AND s.currentstatus != 0
                THEN 'Payment Success'

            WHEN m.maxstatus = 5
                THEN 'Complete'

            WHEN m.maxstatus IS NULL
                THEN 'User did not start payment process'
        END AS paymentfunnelstage
    FROM subscriptions AS s
    LEFT JOIN max_payment_status AS m
        ON s.subscriptionid = m.subscriptionid
)

SELECT
    paymentfunnelstage,
    COUNT(subscriptionid) AS subscriptions
FROM payment_funnel
GROUP BY paymentfunnelstage;
