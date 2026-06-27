-- ============================================================
-- Project : E-Commerce Sales Analysis using SQL
-- Author  : Gananaadh Reddy Dommata
-- Database: Global Superstore
-- Tool    : MySQL
-- ============================================================

-- ============================================================
-- QUESTION 1
-- Total Number of Orders
-- ============================================================

SELECT COUNT(*) AS total_orders
FROM orders;


-- ============================================================
-- QUESTION 2
-- Total Number of Customers
-- ============================================================

SELECT COUNT(DISTINCT `Customer ID`) AS total_customers
FROM orders;


-- ============================================================
-- QUESTION 3
-- Total Sales
-- ============================================================

SELECT SUM(Sales) AS total_sales
FROM orders;


-- ============================================================
-- QUESTION 4
-- Total Profit
-- ============================================================

SELECT SUM(Profit) AS total_profit
FROM orders;


-- ============================================================
-- QUESTION 5
-- Total Categories
-- ============================================================

SELECT COUNT(DISTINCT Category) AS total_categories
FROM orders;


-- ============================================================
-- QUESTION 6
-- List All Categories
-- ============================================================

SELECT DISTINCT Category
FROM orders;


-- ============================================================
-- QUESTION 7
-- Top 10 Highest Sales Transactions
-- ============================================================

SELECT
    `Product Name`,
    `Customer Name`,
    Sales
FROM orders
ORDER BY Sales DESC
LIMIT 10;


-- ============================================================
-- QUESTION 8
-- Top 10 Highest Profit Transactions
-- ============================================================

SELECT
    `Product Name`,
    `Customer Name`,
    Profit
FROM orders
ORDER BY Profit DESC
LIMIT 10;


-- ============================================================
-- QUESTION 9
-- Total Sales by Category
-- ============================================================

SELECT
    Category,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY Category;


-- ============================================================
-- QUESTION 10
-- Total Profit by Category
-- ============================================================

SELECT
    Category,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Category;


-- ============================================================
-- QUESTION 11
-- Top 5 Countries by Total Sales
-- ============================================================

SELECT
    Country,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY Country
ORDER BY total_sales DESC
LIMIT 5;


-- ============================================================
-- QUESTION 12
-- Top 5 Customers by Total Sales
-- ============================================================

SELECT
    `Customer Name`,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 5;


-- ============================================================
-- QUESTION 13
-- Top 10 Products by Total Sales
-- ============================================================

SELECT
    `Product Name`,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================
-- QUESTION 14
-- Total Sales by Region
-- ============================================================

SELECT
    Region,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;


-- ============================================================
-- QUESTION 15
-- Average Sales by Category
-- ============================================================

SELECT
    Category,
    AVG(Sales) AS average_sales
FROM orders
GROUP BY Category;


-- ============================================================
-- QUESTION 16
-- Orders with Sales Greater Than 1000
-- ============================================================

SELECT
    `Order ID`,
    `Customer Name`,
    `Product Name`,
    Sales
FROM orders
WHERE Sales > 1000;


-- ============================================================
-- QUESTION 17
-- Loss Making Orders
-- ============================================================

SELECT
    `Order ID`,
    `Product Name`,
    Profit
FROM orders
WHERE Profit < 0;


-- ============================================================
-- QUESTION 18
-- Categories with Sales Greater Than 4 Million
-- ============================================================

SELECT
    Category,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY Category
HAVING SUM(Sales) > 4000000;


-- ============================================================
-- QUESTION 19
-- Top 5 Customers by Profit
-- ============================================================

SELECT
    `Customer Name`,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY `Customer Name`
ORDER BY total_profit DESC
LIMIT 5;


-- ============================================================
-- QUESTION 20
-- Average Profit by Region
-- ============================================================

SELECT
    Region,
    AVG(Profit) AS average_profit
FROM orders
GROUP BY Region
ORDER BY average_profit DESC;

-- ============================================================
-- QUESTION 21
-- Top 10 Products by Total Profit
-- ============================================================

SELECT
    `Product Name`,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;


-- ============================================================
-- QUESTION 22
-- Orders by Ship Mode
-- ============================================================

SELECT
    `Ship Mode`,
    COUNT(*) AS total_orders
FROM orders
GROUP BY `Ship Mode`
ORDER BY total_orders DESC;


-- ============================================================
-- QUESTION 23
-- Sales by Customer Segment
-- ============================================================

SELECT
    Segment,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY Segment
ORDER BY total_sales DESC;


-- ============================================================
-- QUESTION 24
-- Top 5 Sub-Categories by Sales
-- ============================================================

SELECT
    `Sub-Category`,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY `Sub-Category`
ORDER BY total_sales DESC
LIMIT 5;


-- ============================================================
-- QUESTION 25
-- Top 5 Sub-Categories by Profit
-- ============================================================

SELECT
    `Sub-Category`,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY `Sub-Category`
ORDER BY total_profit DESC
LIMIT 5;


-- ============================================================
-- QUESTION 26
-- Sales by Year
-- ============================================================

SELECT
    YEAR(`Order Date`) AS order_year,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY YEAR(`Order Date`)
ORDER BY order_year;


-- ============================================================
-- QUESTION 27
-- Profit by Year
-- ============================================================

SELECT
    YEAR(`Order Date`) AS order_year,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY YEAR(`Order Date`)
ORDER BY order_year;


-- ============================================================
-- QUESTION 28
-- Sales by Month
-- ============================================================

SELECT
    MONTHNAME(`Order Date`) AS month,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY MONTH(`Order Date`), MONTHNAME(`Order Date`)
ORDER BY MONTH(`Order Date`);


-- ============================================================
-- QUESTION 29
-- Month with Highest Profit
-- ============================================================

SELECT
    MONTHNAME(`Order Date`) AS month,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY MONTH(`Order Date`), MONTHNAME(`Order Date`)
ORDER BY total_profit DESC
LIMIT 1;


-- ============================================================
-- QUESTION 30
-- Average Sales by Year
-- ============================================================

SELECT
    YEAR(`Order Date`) AS order_year,
    AVG(Sales) AS average_sales
FROM orders
GROUP BY YEAR(`Order Date`)
ORDER BY order_year;


-- ============================================================
-- QUESTION 31
-- Sales Classification
-- ============================================================

SELECT
    `Order ID`,
    Sales,
    CASE
        WHEN Sales >= 1000 THEN 'High Sales'
        WHEN Sales >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM orders;


-- ============================================================
-- QUESTION 32
-- Orders by Sales Category
-- ============================================================

SELECT
    CASE
        WHEN Sales >= 1000 THEN 'High Sales'
        WHEN Sales >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category,
    COUNT(*) AS total_orders
FROM orders
GROUP BY sales_category;


-- ============================================================
-- QUESTION 33
-- Total Sales by Sales Category
-- ============================================================

SELECT
    CASE
        WHEN Sales >= 1000 THEN 'High Sales'
        WHEN Sales >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY sales_category;


-- ============================================================
-- QUESTION 34
-- Average Profit by Sales Category
-- ============================================================

SELECT
    CASE
        WHEN Sales >= 1000 THEN 'High Sales'
        WHEN Sales >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category,
    AVG(Profit) AS average_profit
FROM orders
GROUP BY sales_category;


-- ============================================================
-- QUESTION 35
-- Sales & Profit by Category
-- ============================================================

SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Category;


-- ============================================================
-- QUESTION 36
-- Products with Sales Greater than Average Sales
-- ============================================================

SELECT
    `Product Name`,
    Sales
FROM orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM orders
);


-- ============================================================
-- QUESTION 37
-- Customers with Above Average Total Sales
-- ============================================================

SELECT
    `Customer Name`,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY `Customer Name`
HAVING SUM(Sales) >
(
    SELECT AVG(total_sales)
    FROM
    (
        SELECT SUM(Sales) AS total_sales
        FROM orders
        GROUP BY `Customer Name`
    ) AS customer_sales
);


-- ============================================================
-- QUESTION 38
-- Customer Ranking
-- ============================================================

SELECT
    `Customer Name`,
    SUM(Sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS customer_rank
FROM orders
GROUP BY `Customer Name`;


-- ============================================================
-- QUESTION 39
-- Product Ranking by Profit
-- ============================================================

SELECT
    `Product Name`,
    SUM(Profit) AS total_profit,
    DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS product_rank
FROM orders
GROUP BY `Product Name`;


-- ============================================================
-- QUESTION 40
-- Row Number Based on Sales
-- ============================================================

SELECT
    `Order ID`,
    Sales,
    ROW_NUMBER() OVER (ORDER BY Sales DESC) AS row_num
FROM orders;


-- ============================================================
-- QUESTION 41
-- Running Sales
-- ============================================================

SELECT
    `Order Date`,
    Sales,
    SUM(Sales) OVER (ORDER BY `Order Date`) AS running_sales
FROM orders;


-- ============================================================
-- QUESTION 42
-- Product Contribution to Total Sales
-- ============================================================

SELECT
    `Product Name`,
    SUM(Sales) AS total_sales,
    ROUND(
        SUM(Sales) * 100 /
        (SELECT SUM(Sales) FROM orders),
        2
    ) AS percentage_sales
FROM orders
GROUP BY `Product Name`;


-- ============================================================
-- QUESTION 43
-- Top Selling Product in Each Category
-- ============================================================

WITH product_sales AS
(
    SELECT
        Category,
        `Product Name`,
        SUM(Sales) AS total_sales,
        RANK() OVER
        (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS rnk
    FROM orders
    GROUP BY Category, `Product Name`
)
SELECT *
FROM product_sales
WHERE rnk = 1;


-- ============================================================
-- QUESTION 44
-- Customer with Maximum Orders
-- ============================================================

SELECT
    `Customer Name`,
    COUNT(*) AS total_orders
FROM orders
GROUP BY `Customer Name`
ORDER BY total_orders DESC
LIMIT 1;


-- ============================================================
-- QUESTION 45
-- Most Profitable Product in Each Category
-- ============================================================

WITH product_profit AS
(
    SELECT
        Category,
        `Product Name`,
        SUM(Profit) AS total_profit,
        RANK() OVER
        (
            PARTITION BY Category
            ORDER BY SUM(Profit) DESC
        ) AS rnk
    FROM orders
    GROUP BY Category, `Product Name`
)
SELECT *
FROM product_profit
WHERE rnk = 1;


-- ============================================================
-- QUESTION 46
-- Top 3 Customers in Each Region
-- ============================================================

WITH customer_sales AS
(
    SELECT
        Region,
        `Customer Name`,
        SUM(Sales) AS total_sales,
        RANK() OVER
        (
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS rnk
    FROM orders
    GROUP BY Region, `Customer Name`
)
SELECT *
FROM customer_sales
WHERE rnk <= 3;


-- ============================================================
-- QUESTION 47
-- Month-over-Month Sales
-- ============================================================

SELECT
    YEAR(`Order Date`) AS year,
    MONTH(`Order Date`) AS month,
    SUM(Sales) AS total_sales,
    LAG(SUM(Sales))
    OVER (
        ORDER BY YEAR(`Order Date`),
                 MONTH(`Order Date`)
    ) AS previous_month_sales
FROM orders
GROUP BY YEAR(`Order Date`), MONTH(`Order Date`);


-- ============================================================
-- QUESTION 48
-- Top 5 Most Ordered Products
-- ============================================================

SELECT
    `Product Name`,
    COUNT(*) AS total_orders
FROM orders
GROUP BY `Product Name`
ORDER BY total_orders DESC
LIMIT 5;


-- ============================================================
-- QUESTION 49
-- Top 5 Most Profitable Customers
-- ============================================================

SELECT
    `Customer Name`,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY `Customer Name`
ORDER BY total_profit DESC
LIMIT 5;


-- ============================================================
-- QUESTION 50
-- Dashboard Dataset
-- ============================================================

SELECT
    `Order Date`,
    YEAR(`Order Date`) AS Year,
    MONTHNAME(`Order Date`) AS Month,
    Category,
    `Sub-Category`,
    Region,
    `Customer Name`,
    Sales,
    Profit
FROM orders;