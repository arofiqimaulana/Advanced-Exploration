
# SQL for Data Analysis

## Introduction
Structured Query Language (SQL) is a powerful tool for managing and analyzing data stored in relational databases. SQL is widely used for data analysis because it provides a simple yet flexible way to query, manipulate, and summarize data. Whether you're working with small datasets or large-scale enterprise data, SQL is a must-have skill for any data analyst.

## Table of Contents
- [Key SQL Concepts](#key-sql-concepts)
- [Installation](#installation)
- [Basic SQL Queries](#basic-sql-queries)
- [Data Manipulation](#data-manipulation)
  - [Selecting Data](#selecting-data)
  - [Filtering Data](#filtering-data)
  - [Sorting Data](#sorting-data)
  - [Grouping and Aggregating Data](#grouping-and-aggregating-data)
- [Joins](#joins)
  - [Inner Join](#inner-join)
  - [Left Join](#left-join)
  - [Right Join](#right-join)
  - [Full Outer Join](#full-outer-join)
- [Window Functions](#window-functions)
- [Advanced SQL](#advanced-sql)
  - [Subqueries](#subqueries)
  - [Common Table Expressions (CTEs)](#common-table-expressions-ctes)
- [Resources](#resources)

---

## Key SQL Concepts
- **Tables**: Data is stored in tables, which consist of rows and columns.
- **Columns**: Define the attributes or fields of the data.
- **Rows**: Each row represents a record in the table.
- **Primary Key**: A unique identifier for a row in a table.
- **Foreign Key**: A column that creates a relationship between two tables.

---

## Installation

To start using SQL for data analysis, you need access to a relational database management system (RDBMS). Here are some popular options:

1. **SQLite** (lightweight, file-based database):
   - Install SQLite from the official website: https://www.sqlite.org/download.html

2. **PostgreSQL** (open-source, enterprise-level database):
   - Install PostgreSQL: https://www.postgresql.org/download/

3. **MySQL** (widely used in web applications):
   - Install MySQL: https://dev.mysql.com/downloads/

You can also use cloud-based databases like **Google BigQuery**, **Amazon Redshift**, or **Microsoft Azure SQL Database**.

---

## Basic SQL Queries

### Selecting Data
The `SELECT` statement is used to retrieve data from a table.

```sql
SELECT column1, column2
FROM table_name;
```

Example:
```sql
SELECT name, age
FROM customers;
```

### Filtering Data
The `WHERE` clause filters records based on a condition.

```sql
SELECT *
FROM customers
WHERE age > 30;
```

### Sorting Data
The `ORDER BY` clause sorts data in ascending (`ASC`) or descending (`DESC`) order.

```sql
SELECT name, age
FROM customers
ORDER BY age DESC;
```

### Grouping and Aggregating Data
`GROUP BY` is used to group rows with the same values, and aggregate functions like `SUM()`, `COUNT()`, `AVG()` can be used on the grouped data.

```sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department;
```

---

## Joins

### Inner Join
The `INNER JOIN` keyword selects records that have matching values in both tables.

```sql
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;
```

### Left Join
The `LEFT JOIN` returns all records from the left table and the matched records from the right table.

```sql
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.id;
```

### Right Join
The `RIGHT JOIN` returns all records from the right table and the matched records from the left table.

```sql
SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.id;
```

### Full Outer Join
The `FULL OUTER JOIN` returns all records when there is a match in either the left or right table.

```sql
SELECT employees.name, departments.department_name
FROM employees
FULL OUTER JOIN departments ON employees.department_id = departments.id;
```

---

## Window Functions
Window functions perform calculations across a set of table rows that are related to the current row. Common examples are `ROW_NUMBER()`, `RANK()`, and `LAG()`.

```sql
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;
```

---

## Advanced SQL

### Subqueries
A subquery is a query nested inside another query. It can be used in the `SELECT`, `FROM`, or `WHERE` clauses.

```sql
SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

### Common Table Expressions (CTEs)
A CTE is a temporary result set that you can reference within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement.

```sql
WITH avg_salary AS (
    SELECT department, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department
)
SELECT e.name, e.salary, avg_salary.avg_sal
FROM employees e
JOIN avg_salary ON e.department = avg_salary.department;
```

---

## Resources
- [SQL Tutorial](https://www.w3schools.com/sql/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SQL for Data Science on Coursera](https://www.coursera.org/learn/sql-for-data-science)
- [Mode Analytics SQL Tutorial](https://mode.com/sql-tutorial/)

SQL is an essential tool for querying and analyzing structured data in relational databases. Whether you’re working with customer data, financial data, or any structured dataset, SQL provides the flexibility and power to gain insights and make data-driven decisions.
