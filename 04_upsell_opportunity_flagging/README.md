# Upsell Opportunity Flagging with CASE

## Business Problem

A sales team wants to identify customers who may be good candidates for a new product upsell.

A customer is considered an upsell opportunity if they meet at least one of the following conditions:

1. They have at least 5,000 registered users.
2. They currently have only one product subscription.

The goal is to create a customer-level report that summarizes product usage and flags customers who meet either of these conditions.

## Relevant Data

The analysis uses the `Subscriptions` table, including:

* `CustomerID` — identifies the customer
* `ProductID` — identifies the subscribed product
* `NumberOfUsers` — number of registered users associated with the subscription

## Objective

For each customer, calculate:

* `num_products` — total number of product subscriptions
* `total_users` — total number of registered users
* `upsell_opportunity` — binary flag indicating whether the customer meets at least one upsell condition

The flag should return:

* `1` — potential upsell opportunity
* `0` — does not meet the criteria

## Approach

The solution groups subscription data by customer and calculates both the number of products and the total number of users.

A `CASE` statement then evaluates the aggregated values and assigns an upsell flag when either:

* total users are greater than or equal to 5,000, or
* the customer has exactly one product subscription.

## SQL Concepts Used

* `CASE`
* `COUNT()`
* `SUM()`
* `GROUP BY`
* Conditional logic with `OR`
