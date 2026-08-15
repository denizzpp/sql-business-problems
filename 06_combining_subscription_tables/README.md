# Combining Subscription Tables with UNION

## Business Problem

A growth team wants to understand when active customer subscriptions are scheduled to expire in order to support future retention and churn-reduction initiatives.

Subscription data for two different products is stored in separate tables. To analyze all active subscriptions together, the records from both tables first need to be combined into a single dataset.

## Relevant Data

The analysis uses two subscription tables with the same structure:

### `SubscriptionsProduct1`

* `SubscriptionID` — unique subscription identifier
* `CustomerID` — identifies the customer
* `ExpirationDate` — subscription expiration date
* `Active` — indicates whether the subscription is currently active

### `SubscriptionsProduct2`

Contains the same fields for subscriptions to the second product.

## Objective

Combine active subscriptions from both product tables and calculate the number of subscriptions expiring in each year.

Only subscriptions where `Active = 1` should be included.

## Approach

A Common Table Expression (CTE) combines active subscription records from both product tables using `UNION ALL`.

The combined dataset is then grouped by expiration year using `DATE_TRUNC()` to calculate the total number of subscriptions expiring each year.

`UNION ALL` is used instead of `UNION` so that all subscription records are preserved without removing potentially identical rows.

## SQL Concepts Used

* Common Table Expressions (CTEs)
* `UNION ALL`
* `WHERE`
* `DATE_TRUNC()`
* `COUNT()`
* `GROUP BY`
