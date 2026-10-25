# BrightMart Sales Analytics System (MySQL)

A retail analytics database that manages employees, customers, products and orders, and turns the data into business insights such as top customers, best-selling products, employee performance and monthly trends.

## Database design

6 tables linked with primary and foreign keys:

| Table | Purpose |
|---|---|
| `departments` | Company departments |
| `employees` | Staff, with a self-referencing `manager_id` for the hierarchy |
| `customers` | Customer details and signup date |
| `products` | Catalog with price and stock |
| `orders` | One row per order (customer, sales employee, date, status) |
| `order_items` | Products inside each order |

## What the project covers

| # | Task | SQL concepts |
|---|---|---|
| 1 | Design the schema | CREATE TABLE, keys, CHECK, NOT NULL |
| 2 | Insert sample data | INSERT (25 employees, 25 customers, 25 products, 30 orders) |
| 3 | Top 5 customers by spend | JOIN, GROUP BY, SUM, LIMIT |
| 4 | Total sales per month, with growth | Date functions, CTE, LAG |
| 5 | Top earner in each department | RANK, PARTITION BY |
| 6 | Full management hierarchy | Recursive CTE |
| 7 | Customers who never ordered | NOT EXISTS |
| 8 | `monthly_sales_summary` | VIEW |
| 9 | Order history for a customer | Stored procedure |
| 10 | Auto-reduce stock on new order | Trigger |
| 11 | Speed up slow queries | EXPLAIN, INDEX |

## How to run

1. Open MySQL Workbench (MySQL 8 or later is required).
2. Open `brightmart_project.sql`.
3. Select all and run (Ctrl+Shift+Enter).
4. The script drops and recreates the `brightmart` database, so it can be re-run safely.

## Key learnings

- Good table design makes complex questions easy to answer.
- Recursive CTEs can walk through hierarchies of any depth.
- Triggers keep data accurate without manual work.
- EXPLAIN shows why a query is slow before you add an index.
