# Payment Status Time Analysis with LEAD()

## Business Problem

A customer reported that their payment process took too long before eventually ending in an error.

The support and analytics teams want to investigate the customer's payment journey and understand how much time was spent at each stage of the payment process.

Each status change is recorded chronologically in the `PaymentStatusLog` table. By comparing the timestamp of each status with the timestamp of the next status, the time spent at each stage can be calculated.

## Relevant Data

The analysis uses the `PaymentStatusLog` table, including:

* `StatusMovementID` — unique identifier for each status movement
* `SubscriptionID` — identifies the subscription
* `StatusID` — payment status reached
* `MovementDate` — timestamp when the status was recorded

The analysis focuses on `SubscriptionID = 38844`.

## Objective

For each payment status movement, return:

* `statusmovementid` — status movement identifier
* `subscriptionid` — subscription identifier
* `statusid` — payment status
* `movementdate` — timestamp of the current status
* `next_status_movement_date` — timestamp of the next chronological status
* `time_in_status` — time elapsed before moving to the next status

## Approach

The solution uses the `LEAD()` window function to retrieve the timestamp of the next payment status for each subscription.

Payment events are partitioned by subscription and ordered chronologically by `MovementDate`.

A CTE first calculates the next status timestamp. The difference between that timestamp and the current `MovementDate` is then used to calculate the time spent in each status.

## SQL Concepts Used

* Common Table Expressions (CTEs)
* Window functions
* `LEAD()`
* `PARTITION BY`
* `ORDER BY`
* Timestamp comparison
* Sequential event analysis
