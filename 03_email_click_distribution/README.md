# Email Click Distribution Analysis

## Business Problem

A marketing team wants to evaluate engagement with a recent email campaign by understanding how frequently users clicked the campaign link.

A specific front-end tracking event, `EventID = 5`, is recorded whenever a user reaches the campaign's landing page through the email link.

Rather than calculating only an overall metric, the goal is to understand the **distribution of clicks per user** — for example, how many users clicked once, twice, three times, and so on.

Users who never clicked the link are not included because the event log only records events that actually occurred.

## Relevant Data

The analysis uses the `FrontendEventLog` table, including:

* `UserID` — identifies the user who triggered the event
* `EventID` — identifies the type of front-end event
* `EventTimestamp` — timestamp of the event

`EventID = 5` represents a click from the campaign email to its landing page.

## Objective

Determine the distribution of users by number of email link clicks.

For each click frequency, calculate:

* `num_link_clicks` — number of times a user clicked the campaign link
* `num_users` — number of users with that click frequency

## Approach

The solution uses a Common Table Expression (CTE) to first calculate the number of campaign link clicks for each user.

The resulting user-level click counts are then grouped again to determine how many users fall into each click-frequency category.

## SQL Concepts Used

* Common Table Expressions (CTEs)
* `WHERE`
* `COUNT()`
* `GROUP BY`
* `ORDER BY`
