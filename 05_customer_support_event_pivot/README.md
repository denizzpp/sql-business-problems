# Customer Support Event Pivot with CASE

## Business Problem

A product team wants to evaluate user behavior on a redesigned customer support page as part of an A/B test.

To measure engagement with the support experience, several front-end events are tracked for each user:

* Viewing the help center page
* Clicking the Frequently Asked Questions section
* Clicking the contact support button
* Submitting a support ticket

The goal is to create a user-level activity report showing how many times each user completed each customer support event.

## Relevant Data

The analysis uses two tables:

### `FrontendEventLog`

Contains individual user events, including:

* `UserID` — identifies the user
* `EventID` — identifies the event that occurred
* `EventTimestamp` — timestamp of the event

### `FrontendEventDefinitions`

Contains information about each event, including:

* `EventID` — unique event identifier
* `Description` — description of the event
* `EventType` — category of the event

The relevant customer support events are:

| EventID | Event                   |
| ------- | ----------------------- |
| 1       | Viewed Help Center Page |
| 2       | Clicked FAQs            |
| 3       | Clicked Contact Support |
| 4       | Submitted Ticket        |

## Objective

For each user, calculate how many times they:

* Viewed the help center page
* Clicked the FAQs
* Clicked contact support
* Submitted a support ticket

Only events categorized as `Customer Support` should be included.

## Approach

The solution joins the event log with the event definitions table to identify customer support events.

Conditional aggregation is then used to transform event rows into separate activity columns. Each `CASE` statement returns `1` when a specific event occurs and `0` otherwise, while `SUM()` calculates the total number of occurrences for each user.

## SQL Concepts Used

* `JOIN`
* `CASE`
* Conditional aggregation
* `SUM()`
* `GROUP BY`
* `WHERE`
* Row-to-column transformation
