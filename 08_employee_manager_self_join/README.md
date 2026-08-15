# Employee-Manager Relationships with a Self Join

## Business Problem

The sales leadership team needs a contact list for employees in the Sales department and their respective managers.

Employee and manager information is stored in the same `Employees` table. Because managers are also employees, the table needs to be joined to itself to connect each employee with their manager.

Some employees do not have a manager recorded in the database. In these cases, the employee's own email address should be used as the contact email.

## Relevant Data

The analysis uses the `Employees` table, including:

* `EmployeeID` — unique identifier for each employee
* `Name` — employee name
* `Email` — employee email address
* `Department` — employee department
* `ManagerID` — identifies the employee's manager

`ManagerID` references another `EmployeeID` within the same table.

## Objective

Create a contact list for employees in the Sales department containing:

* `employeeid` — employee identifier
* `employee_name` — employee name
* `manager_name` — employee's manager
* `contact_email` — manager's email when available, otherwise the employee's own email

## Approach

The `Employees` table is joined to itself using two aliases: one representing employees and the other representing managers.

A `LEFT JOIN` preserves employees even when no matching manager exists.

`COALESCE()` is then used to return the manager's email when available and fall back to the employee's email when the manager email is `NULL`.

## SQL Concepts Used

* Self joins
* `LEFT JOIN`
* Table aliases
* `COALESCE()`
* `WHERE`
* Hierarchical relationships
* NULL handling
