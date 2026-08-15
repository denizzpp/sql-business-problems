# Cancellation Reason Analysis with UNION

## Business Problem

A growth team wants to better understand why customers cancel their subscriptions in order to support future churn-reduction initiatives.

Customers can select up to three cancellation reasons, which are stored in separate columns. To analyze these reasons effectively, the data first needs to be transformed into a single list of cancellation reasons.

The initial focus is to determine how many canceled subscriptions reported **"Expensive"** as one of their reasons for leaving.

## Relevant Data

The analysis uses the `Cancelations` table, including:

* `SubscriptionID` — identifies the canceled subscription
* `CancelationReason1` — first selected cancellation reason
* `CancelationReason2` — second selected cancellation reason
* `CancelationReason3` — third selected cancellation reason

Each subscription can contain up to three different cancellation reasons, and some reason fields may contain `NULL` values.

## Objective

Calculate the proportion of canceled subscriptions that selected `Expensive` as at least one of their cancellation reasons.

## Approach

The solution first uses a Common Table Expression (CTE) and `UNION` to transform the three cancellation-reason columns into a single `reason` column.

After the data is unpivoted, conditional aggregation is used to count subscriptions that selected `Expensive`.

This count is then divided by the total number of distinct canceled subscriptions to calculate the proportion associated with price-related cancellations.

## SQL Concepts Used

* Common Table Expressions (CTEs)
* `UNION`
* Unpivoting columns into rows
* `CASE`
* `COUNT()`
* `COUNT(DISTINCT)`
* `CAST()`
* Conditional aggregation
