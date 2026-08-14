# Payment Funnel Analysis with Multiple CTEs

## Business Problem

A product team wants to understand how far each subscription progresses through the payment process and identify where users drop out.

The payment process consists of five main stages:

1. Payment widget opened
2. Payment information entered
3. Payment submitted
4. Payment successfully processed
5. Payment completed

Errors can occur during the process. A user may encounter an error while submitting payment information, or a payment may fail during third-party processing.

The goal is to determine the furthest payment stage reached by each subscription and classify subscriptions into the appropriate payment funnel stage.

## Relevant Data

The analysis uses two main tables:

### `Subscriptions`

Contains subscription-level information, including:

- `SubscriptionID` — unique identifier for each subscription
- `CurrentStatus` — current payment status of the subscription

### `PaymentStatusLog`

Tracks status changes throughout the payment process:

- `SubscriptionID` — subscription identifier
- `StatusID` — payment status reached
- `MovementDate` — timestamp of the status change

Payment statuses are defined as:

| StatusID | Payment Stage |
|---|---|
| 0 | Error |
| 1 | Payment Widget Opened |
| 2 | Payment Entered |
| 3 | Payment Submitted |
| 4 | Payment Success |
| 5 | Complete |

## Objective

The analysis should:

1. Determine the maximum payment status reached by each subscription.
2. Combine this information with the subscription's current status.
3. Classify each subscription into its appropriate payment funnel stage.
4. Count the number of subscriptions in each funnel stage.

## Approach

The solution uses two Common Table Expressions (CTEs):

- The first CTE calculates the highest `StatusID` reached by each subscription.
- The second CTE joins these results with the `Subscriptions` table and uses conditional logic to assign each subscription to a funnel stage.

A `LEFT JOIN` is used so that subscriptions that never entered the payment process are still included in the analysis.

## SQL Concepts Used

- Common Table Expressions (CTEs)
- `LEFT JOIN`
- `CASE`
- `MAX()`
- `COUNT()`
- `GROUP BY`
