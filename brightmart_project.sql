-- CAPSTONE: BRIGHTMART SALES ANALYTICS SYSTEM 

CREATE DATABASE brightmart;
USE brightmart;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    dept_id    INT NOT NULL,
    manager_id INT NULL,
    salary     DECIMAL(10,2) CHECK (salary > 0),
    hire_date  DATE,
    FOREIGN KEY (dept_id)    REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    city        VARCHAR(40),
    signup_date DATE
);

CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(60) NOT NULL,
    category     VARCHAR(30),
    price        DECIMAL(8,2) CHECK (price > 0),
    stock        INT CHECK (stock >= 0)       
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT NOT NULL,
    emp_id      INT NOT NULL,
    order_date  DATE,
    status      VARCHAR(15) CHECK (status IN ('completed','cancelled')),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (emp_id)      REFERENCES employees(emp_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT CHECK (quantity > 0),
    unit_price    DECIMAL(8,2),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO departments VALUES
(1,'Sales'),(2,'Marketing'),(3,'Operations'),
(4,'Customer Support'),(5,'Finance'),(6,'IT');

INSERT INTO employees VALUES
(1,'Rajesh Mehta',3,NULL,250000,'2015-01-10'),
(2,'Anita Rao',1,1,150000,'2016-03-15'),
(3,'Vikram Singh',2,1,140000,'2016-06-01'),
(4,'Sunita Nair',3,1,145000,'2017-02-20'),
(5,'Arvind Kumar',4,1,120000,'2017-08-11'),
(6,'Meena Iyer',5,1,155000,'2016-11-05'),
(7,'Karan Shah',6,1,160000,'2016-09-09'),
(8,'Priya Das',1,2,90000,'2018-04-12'),
(9,'Rohan Gupta',1,2,85000,'2018-07-23'),
(10,'Neha Verma',1,8,60000,'2019-01-14'),
(11,'Amit Joshi',1,8,62000,'2019-05-30'),
(12,'Pooja Reddy',1,9,58000,'2020-02-17'),
(13,'Suresh Pillai',1,9,64000,'2020-09-01'),
(14,'Divya Menon',2,3,80000,'2018-10-10'),
(15,'Sanjay Bose',2,14,55000,'2020-03-03'),
(16,'Tara Kapoor',3,4,75000,'2019-06-18'),
(17,'Manoj Tiwari',3,16,48000,'2021-01-25'),
(18,'Lata Sharma',4,5,70000,'2019-11-11'),
(19,'Farhan Ali',4,18,45000,'2021-04-19'),
(20,'Ishita Roy',5,6,78000,'2018-12-02'),
(21,'Gaurav Jain',5,20,52000,'2021-07-07'),
(22,'Nikhil Patel',6,7,95000,'2018-05-21'),
(23,'Sneha Kulkarni',6,22,65000,'2020-08-08'),
(24,'Harsh Vora',1,10,40000,'2022-02-14'),
(25,'Zoya Khan',1,11,42000,'2022-06-27');

INSERT INTO customers VALUES
(1,'Aarav Sharma','Delhi','2025-01-05'),
(2,'Diya Patel','Mumbai','2025-01-12'),
(3,'Vihaan Reddy','Hyderabad','2025-01-20'),
(4,'Ananya Iyer','Chennai','2025-02-02'),
(5,'Arjun Nair','Bengaluru','2025-02-10'),
(6,'Ishaan Gupta','Delhi','2025-02-18'),
(7,'Saanvi Joshi','Pune','2025-02-25'),
(8,'Kabir Singh','Delhi','2025-03-03'),
(9,'Myra Das','Kolkata','2025-03-11'),
(10,'Reyansh Mehta','Mumbai','2025-03-19'),
(11,'Kiara Kapoor','Delhi','2025-03-28'),
(12,'Aditya Rao','Bengaluru','2025-04-04'),
(13,'Navya Menon','Chennai','2025-04-12'),
(14,'Vivaan Shah','Mumbai','2025-04-20'),
(15,'Anika Bose','Kolkata','2025-04-29'),
(16,'Krish Verma','Pune','2025-05-06'),
(17,'Riya Pillai','Hyderabad','2025-05-15'),
(18,'Dev Tiwari','Delhi','2025-05-23'),
(19,'Tara Khan','Mumbai','2025-06-01'),
(20,'Neel Kulkarni','Pune','2025-06-09'),
(21,'Pari Jain','Bengaluru','2025-06-17'),
(22,'Samar Ali','Chennai','2025-06-25'),
(23,'Jiya Roy','Kolkata','2025-07-03'),
(24,'Yash Vora','Hyderabad','2025-07-11'),
(25,'Mahi Sharma','Delhi','2025-07-19');

INSERT INTO products VALUES
(1,'Basmati Rice 5kg','Grocery',450,200),
(2,'Whole Wheat Atta 10kg','Grocery',420,150),
(3,'Olive Oil 1L','Grocery',780,80),
(4,'Green Tea 100 bags','Grocery',260,120),
(5,'Notebook Pack','Stationery',180,300),
(6,'Gel Pens Box','Stationery',120,250),
(7,'Office Chair','Furniture',5200,25),
(8,'Study Desk','Furniture',6800,15),
(9,'LED Bulb 9W','Electronics',110,500),
(10,'Bluetooth Speaker','Electronics',2200,60),
(11,'Wireless Mouse','Electronics',650,90),
(12,'USB-C Cable','Electronics',350,180),
(13,'Cotton T-Shirt','Apparel',499,140),
(14,'Denim Jeans','Apparel',1299,70),
(15,'Running Shoes','Apparel',2499,45),
(16,'Shampoo 500ml','Personal Care',340,160),
(17,'Face Wash','Personal Care',220,190),
(18,'Toothpaste 200g','Personal Care',120,400),
(19,'Water Bottle 1L','Home',299,220),
(20,'Cookware Set','Home',3200,30),
(21,'Bed Sheet Set','Home',1199,55),
(22,'Protein Bar Box','Grocery',899,75),
(23,'Backpack','Apparel',1599,50),
(24,'Desk Lamp','Home',799,65),
(25,'Power Bank','Electronics',1799,40);

INSERT INTO orders VALUES
(1,1,8,'2025-02-03','completed'),
(2,2,9,'2025-02-14','completed'),
(3,3,10,'2025-02-21','completed'),
(4,4,11,'2025-03-05','completed'),
(5,1,8,'2025-03-12','completed'),
(6,5,12,'2025-03-20','completed'),
(7,6,13,'2025-03-28','completed'),
(8,2,9,'2025-04-02','completed'),
(9,7,24,'2025-04-10','completed'),
(10,8,25,'2025-04-18','completed'),
(11,3,10,'2025-04-25','completed'),
(12,9,8,'2025-05-06','completed'),
(13,1,11,'2025-05-14','completed'),
(14,10,12,'2025-05-22','completed'),
(15,4,13,'2025-05-30','cancelled'),
(16,11,9,'2025-06-08','completed'),
(17,12,24,'2025-06-15','completed'),
(18,5,25,'2025-06-24','completed'),
(19,13,10,'2025-07-02','completed'),
(20,2,8,'2025-07-11','completed'),
(21,14,11,'2025-07-19','completed'),
(22,15,12,'2025-07-27','cancelled'),
(23,1,13,'2025-08-04','completed'),
(24,16,9,'2025-08-12','completed'),
(25,17,24,'2025-08-20','completed'),
(26,18,25,'2025-08-28','completed'),
(27,19,10,'2025-09-05','completed'),
(28,20,8,'2025-09-13','completed'),
(29,3,11,'2025-09-21','completed'),
(30,6,12,'2025-09-29','completed');


INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,1,2,450),(1,4,1,260),
(2,7,1,5200),
(3,10,1,2200),(3,12,2,350),
(4,13,3,499),(4,17,2,220),
(5,8,1,6800),(5,19,2,299),
(6,11,1,650),(6,9,4,110),
(7,15,1,2499),
(8,20,1,3200),(8,24,1,799),
(9,5,5,180),(9,6,3,120),
(10,14,2,1299),
(11,25,1,1799),(11,12,1,350),
(12,3,2,780),(12,22,1,899),
(13,21,1,1199),(13,19,1,299),(13,18,3,120),
(14,16,2,340),(14,17,1,220),
(15,7,1,5200),
(16,23,1,1599),(16,13,2,499),
(17,2,1,420),(17,1,1,450),
(18,10,1,2200),(18,25,1,1799),
(19,20,1,3200),
(20,8,1,6800),(20,24,2,799),
(21,15,1,2499),(21,14,1,1299),
(22,11,2,650),
(23,7,2,5200),
(24,22,2,899),(24,4,2,260),
(25,9,10,110),(25,19,3,299),
(26,21,1,1199),(26,16,2,340),
(27,10,2,2200),
(28,23,1,1599),(28,5,4,180),
(29,20,1,3200),(29,25,1,1799),
(30,12,3,350),(30,3,1,780);


--  "Top 5 customers by total spend"
-- Concepts: JOIN, GROUP BY, SUM, ORDER BY, LIMIT
-- Cancelled orders are excluded because they brought no money.
SELECT c.customer_id, c.name, c.city,
       SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spend DESC
LIMIT 5;

-- =====================================================
-- "Total sales per month" report
-- Concepts: Date functions (DATE_FORMAT), GROUP BY, CTE, LAG window function
-- DATE_FORMAT(date,'%Y-%m') turns 2025-03-12 into 2025-03.
-- LAG() looks at the previous row, so we can calculate month-over-month growth.
-- =====================================================

WITH monthly AS (
    SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
           COUNT(DISTINCT o.order_id)         AS orders,
           SUM(oi.quantity * oi.unit_price)   AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'completed'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT month, orders, revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
       ROUND(100 * (revenue - LAG(revenue) OVER (ORDER BY month))
                 / LAG(revenue) OVER (ORDER BY month), 1) AS growth_pct
FROM monthly
ORDER BY month;

-- =====================================================
-- "Top earner within each department"
-- Concepts: Window function RANK() with PARTITION BY, CTE
-- PARTITION BY restarts the ranking inside every department.
-- Rank 1 = highest salary in that department.
-- =====================================================

WITH ranked AS (
    SELECT e.emp_id, e.name, e.dept_id, e.salary,
           RANK() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) AS salary_rank
    FROM employees e
)
SELECT d.dept_name, r.name AS top_earner, r.salary
FROM ranked r
JOIN departments d ON r.dept_id = d.dept_id
WHERE r.salary_rank = 1
ORDER BY r.salary DESC;

-- =====================================================
-- Full employee management hierarchy, all levels deep
-- Concepts: Recursive CTE, UNION ALL, CONCAT, REPEAT
-- Part 1 (anchor): start from the CEO, who has no manager.
-- Part 2 (recursive): repeatedly add people who report to someone already found.
-- The query stops by itself when no new employees are found.
-- =====================================================

WITH RECURSIVE org AS (
    SELECT emp_id, name, manager_id, 1 AS level,
           CAST(name AS CHAR(500)) AS path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.name, e.manager_id, o.level + 1,
           CONCAT(o.path, ' > ', e.name)
    FROM employees e
    JOIN org o ON e.manager_id = o.emp_id
)
SELECT emp_id,
       CONCAT(REPEAT('    ', level - 1), name) AS employee,   -- indent by level
       level,
       path
FROM org
ORDER BY path;

-- =====================================================
--  Find "customers who have never placed an order"
-- Concepts: NOT EXISTS (correlated subquery)
-- For each customer, the subquery checks if any order exists.
-- NOT EXISTS is safer than NOT IN because NOT IN breaks when NULLs appear.
-- Alternative: LEFT JOIN orders ... WHERE o.order_id IS NULL
-- =====================================================

SELECT c.customer_id, c.name, c.city
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- =====================================================
--  Create a VIEW called monthly_sales_summary for repeated use
-- Concepts: CREATE VIEW
-- A view is a saved query that behaves like a table, so reports become short.
-- =====================================================

CREATE VIEW monthly_sales_summary AS
SELECT DATE_FORMAT(o.order_date, '%Y-%m')       AS month,
       COUNT(DISTINCT o.order_id)               AS orders,
       SUM(oi.quantity * oi.unit_price)         AS revenue,
       ROUND(SUM(oi.quantity * oi.unit_price)
             / COUNT(DISTINCT o.order_id), 2)   AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m');

SELECT * FROM monthly_sales_summary ORDER BY month;

-- =====================================================
-- STORED PROCEDURE: give a customer_id, get their full order history
-- Concepts: CREATE PROCEDURE, IN parameter, DELIMITER, CALL
-- A stored procedure is a saved block of SQL you run with CALL.
-- DELIMITER $$ lets Workbench read the whole block as one statement.
-- =====================================================

DELIMITER $$
CREATE PROCEDURE get_customer_history(IN p_customer_id INT)
BEGIN
    SELECT o.order_id, o.order_date, o.status,
           p.product_name, oi.quantity, oi.unit_price,
           oi.quantity * oi.unit_price AS line_total
    FROM orders o
    JOIN order_items oi ON o.order_id   = oi.order_id
    JOIN products p     ON oi.product_id = p.product_id
    WHERE o.customer_id = p_customer_id
    ORDER BY o.order_date, o.order_id;
END$$
DELIMITER ;

CALL get_customer_history(1);

-- =====================================================
-- TRIGGER that automatically reduces product stock when an order is placed
-- Concepts: CREATE TRIGGER, AFTER INSERT, NEW
-- A trigger runs by itself when something happens.
-- NEW.quantity and NEW.product_id are the values of the row just inserted.
-- It is created AFTER the sample data so the starting stock stays untouched.
-- =====================================================

DELIMITER $$
CREATE TRIGGER reduce_stock_after_order
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END$$
DELIMITER ;

-- Test: Study Desk (product 8) has stock 15 before the order.
SELECT product_name, stock AS stock_before FROM products WHERE product_id = 8;

INSERT INTO orders VALUES (31,5,12,'2025-10-02','completed');
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (31,8,2,6800);

-- It should now show 13, because the trigger subtracted the 2 desks.
SELECT product_name, stock AS stock_after FROM products WHERE product_id = 8;

-- =====================================================
-- Analyze a slow query with EXPLAIN and add an INDEX
-- Concepts: EXPLAIN, CREATE INDEX
-- EXPLAIN shows how MySQL plans to run a query.
-- type = ALL means a full table scan (reads every row = slow on big data).
-- After the index, type becomes range (jumps straight to matching rows).
-- Note: foreign key columns are indexed automatically, so we index order_date.
-- On tiny tables MySQL may still choose a full scan; the gain appears at scale.
-- =====================================================

EXPLAIN SELECT * FROM orders
WHERE order_date BETWEEN '2025-06-01' AND '2025-06-30';

CREATE INDEX idx_orders_date ON orders(order_date);

EXPLAIN SELECT * FROM orders
WHERE order_date BETWEEN '2025-06-01' AND '2025-06-30';

-- =====================================================
