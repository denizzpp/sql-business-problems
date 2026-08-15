# SQL Business Problems

A collection of SQL exercises focused on solving practical business problems and developing analytical problem-solving skills.

Each project includes a short description of the business problem, the analytical approach, and my SQL solution.

## Projects

### 1. Payment Funnel Analysis

Analyze subscription payment activity to determine the furthest stage reached by each user and identify drop-offs throughout the payment process.

**SQL concepts:** CTEs, JOIN, CASE, aggregate functions, GROUP BY

[View Project](./01_payment_funnel_analysis/)

### 2. Monthly Revenue Descriptive Statistics

Analyze monthly subscription revenue by product and summarize performance and variability using descriptive statistics.

**SQL concepts:** CTEs, JOIN, DATE_TRUNC, aggregate functions, GROUP BY

[View Project](./02_monthly_revenue_statistics/)

### 3. Email Click Distribution Analysis

Analyze email campaign engagement by measuring the distribution of link-click frequency across users.

**SQL concepts:** CTEs, filtering, aggregate functions, GROUP BY, ORDER BY

[View Project](./03_email_click_distribution/)

### 4. Upsell Opportunity Flagging

Identify potential sales upsell opportunities by creating a binary customer flag based on user volume and product subscriptions.

**SQL concepts:** CASE, COUNT, SUM, GROUP BY, conditional logic

[View Project](./04_upsell_opportunity_flagging/)

### 5. Customer Support Event Pivot

Transform front-end customer support events into user-level activity metrics using conditional aggregation.

**SQL concepts:** JOIN, CASE, conditional aggregation, SUM, GROUP BY

[View Project](./05_customer_support_event_pivot/)

### 6. Combining Subscription Tables

Combine active subscriptions stored across separate product tables and analyze upcoming expirations by year.

**SQL concepts:** CTEs, UNION ALL, filtering, DATE_TRUNC, aggregate functions, GROUP BY

[View Project](./06_combining_subscription_tables/)

### 7. Cancellation Reason Analysis

Transform multiple cancellation reason columns into rows and measure the share of canceled subscriptions associated with price concerns.

**SQL concepts:** CTEs, UNION, unpivoting, CASE, COUNT DISTINCT, conditional aggregation

[View Project](./07_cancellation_reason_analysis/)

### 8. Employee-Manager Self Join Analysis

Connect employees with their managers using a self join and handle missing manager contact information with fallback logic.

**SQL concepts:** self joins, LEFT JOIN, COALESCE, table aliases, NULL handling

[View Project](./08_employee_manager_self_join/)

### 9. Month-over-Month Revenue Comparison

Compare consecutive months using a self join and identify periods where total revenue increased month over month.

**SQL concepts:** CTEs, self joins, DATE_TRUNC, DATEDIFF, SUM, row-to-row comparison

[View Project](./09_month_over_month_revenue_self_join/)

## Topics Covered

- Common Table Expressions (CTEs)
- CASE statements
- JOINs
- UNION
- Self Joins
- Window Functions
- Aggregations
- Business-oriented SQL analysis

## Learning Context

These analysis were completed as part of the **SQL Hands-On Practice: Solve Business Problems** course by Jess Ramos. The business problems have been summarized in my own words, and the SQL solution reflects my own work and approach.
