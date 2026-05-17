/* =========================================================
   PROJECT: RETAIL SALES & INVENTORY MANAGEMENT SYSTEM
   ========================================================= */


/* =========================================================
   CREATE DATABASE
   ========================================================= */

CREATE DATABASE retail_management;

USE retail_management;


/* =========================================================
   CREATE TABLE: CATEGORIES
   ========================================================= */

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);


/* =========================================================
   CREATE TABLE: CUSTOMERS
   ========================================================= */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    city VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);


/* =========================================================
   CREATE TABLE: EMPLOYEES
   ========================================================= */

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE
);


/* =========================================================
   CREATE TABLE: PRODUCTS
   ========================================================= */

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),

    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);


/* =========================================================
   CREATE TABLE: INVENTORY
   ========================================================= */

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    stock_quantity INT,
    reorder_level INT,

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);


/* =========================================================
   CREATE TABLE: SALES
   ========================================================= */

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);



/* =========================================================
   INSERT DATA INTO CATEGORIES
   ========================================================= */

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Groceries'),
(3, 'Fashion'),
(4, 'Home Appliances');


/* =========================================================
   INSERT DATA INTO CUSTOMERS
   ========================================================= */

INSERT INTO customers VALUES
(101, 'John', 'Smith', 'Male', 'New York', '1234567890', 'john@email.com'),
(102, 'Mary', 'Johnson', 'Female', 'Chicago', '1234567891', 'mary@email.com'),
(103, 'David', 'Brown', 'Male', 'Houston', '1234567892', 'david@email.com'),
(104, 'Sarah', 'Miller', 'Female', 'Miami', '1234567893', 'sarah@email.com'),
(105, 'Daniel', 'Wilson', 'Male', 'Dallas', '1234567894', 'daniel@email.com');


/* =========================================================
   INSERT DATA INTO EMPLOYEES
   ========================================================= */

INSERT INTO employees VALUES
(201, 'Michael', 'Adams', 'Sales', '2022-01-10'),
(202, 'Linda', 'White', 'Sales', '2021-06-15'),
(203, 'James', 'Taylor', 'Sales', '2023-02-20');


/* =========================================================
   INSERT DATA INTO PRODUCTS
   ========================================================= */

INSERT INTO products VALUES
(301, 'Laptop', 1, 1200.00),
(302, 'Smartphone', 1, 800.00),
(303, 'Rice Bag', 2, 50.00),
(304, 'T-Shirt', 3, 25.00),
(305, 'Microwave', 4, 300.00);


/* =========================================================
   INSERT DATA INTO INVENTORY
   ========================================================= */

INSERT INTO inventory VALUES
(1, 301, 20, 5),
(2, 302, 35, 10),
(3, 303, 100, 20),
(4, 304, 50, 15),
(5, 305, 10, 3);


/* =========================================================
   INSERT DATA INTO SALES
   ========================================================= */

INSERT INTO sales VALUES
(401, 101, 201, 301, 1, '2025-01-05'),
(402, 102, 202, 302, 2, '2025-01-06'),
(403, 103, 201, 303, 5, '2025-01-07'),
(404, 104, 203, 304, 3, '2025-01-08'),
(405, 105, 202, 305, 1, '2025-01-09'),
(406, 101, 201, 302, 1, '2025-01-10'),
(407, 103, 203, 304, 2, '2025-01-11'),
(408, 104, 202, 301, 1, '2025-01-12');



/* =========================================================
   BUSINESS ANALYSIS QUERIES
   ========================================================= */


/* =========================================================
   1. VIEW ALL CUSTOMERS
   ========================================================= */

SELECT * FROM customers;


/* =========================================================
   2. VIEW ALL PRODUCTS
   ========================================================= */

SELECT * FROM products;


/* =========================================================
   3. TOTAL SALES REVENUE
   ========================================================= */

SELECT
    SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p
ON s.product_id = p.product_id;


/* =========================================================
   4. BEST-SELLING PRODUCTS
   ========================================================= */

SELECT
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;


/* =========================================================
   5. TOP CUSTOMERS BY PURCHASES
   ========================================================= */

SELECT
    c.first_name,
    c.last_name,
    SUM(s.quantity * p.price) AS total_spent
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;


/* =========================================================
   6. EMPLOYEE SALES PERFORMANCE
   ========================================================= */

SELECT
    e.first_name,
    e.last_name,
    SUM(s.quantity * p.price) AS total_sales
FROM sales s
JOIN employees e
ON s.employee_id = e.employee_id
JOIN products p
ON s.product_id = p.product_id
GROUP BY e.first_name, e.last_name
ORDER BY total_sales DESC;


/* =========================================================
   7. LOW STOCK PRODUCTS
   ========================================================= */

SELECT
    p.product_name,
    i.stock_quantity,
    i.reorder_level
FROM inventory i
JOIN products p
ON i.product_id = p.product_id
WHERE i.stock_quantity <= i.reorder_level;


/* =========================================================
   8. MONTHLY SALES REPORT
   ========================================================= */

SELECT
    MONTH(sale_date) AS sales_month,
    SUM(s.quantity * p.price) AS monthly_revenue
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY MONTH(sale_date)
ORDER BY sales_month;


/* =========================================================
   9. CATEGORY PERFORMANCE ANALYSIS
   ========================================================= */

SELECT
    c.category_name,
    SUM(s.quantity * p.price) AS total_category_sales
FROM sales s
JOIN products p
ON s.product_id = p.product_id
JOIN categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_category_sales DESC;


/* =========================================================
   10. CUSTOMER PURCHASE HISTORY
   ========================================================= */

SELECT
    c.first_name,
    c.last_name,
    p.product_name,
    s.quantity,
    s.sale_date
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id
ORDER BY s.sale_date;


/* =========================================================
   11. PRODUCTS ABOVE AVERAGE PRICE
   ========================================================= */

SELECT
    product_name,
    price
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);


/* =========================================================
   12. SALES STATUS USING CASE STATEMENT
   ========================================================= */

SELECT
    p.product_name,
    SUM(s.quantity) AS total_quantity,

    CASE
        WHEN SUM(s.quantity) >= 5 THEN 'High Sales'
        WHEN SUM(s.quantity) >= 3 THEN 'Moderate Sales'
        ELSE 'Low Sales'
    END AS sales_status

FROM sales s
JOIN products p
ON s.product_id = p.product_id

GROUP BY p.product_name;



/* =========================================================
   CREATE VIEW: SALES SUMMARY
   ========================================================= */

CREATE VIEW sales_summary AS

SELECT
    s.sale_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    p.product_name,
    e.first_name AS employee_first_name,
    s.quantity,
    p.price,
    (s.quantity * p.price) AS total_amount,
    s.sale_date

FROM sales s

JOIN customers c
ON s.customer_id = c.customer_id

JOIN products p
ON s.product_id = p.product_id

JOIN employees e
ON s.employee_id = e.employee_id;



/* =========================================================
   VIEW SALES SUMMARY
   ========================================================= */

SELECT * FROM sales_summary;