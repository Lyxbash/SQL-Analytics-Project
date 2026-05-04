SELECT * FROM gold.fact_sales;

-- find total sales
SELECT SUM(sales_amount) AS total_sales 
from gold.fact_sales;

-- find how many items are sold
SELECT SUM(quantity) AS total_quantity 
FROM gold.fact_sales;

SELECT product_key, SUM(quantity)
FROM gold.fact_sales GROUP BY product_key 
ORDER BY product_key;

-- find the avg selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales;

-- find the total number of orders
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

-- find the total number of products
SELECT COUNT(DISTINCT(product_key)) AS total_unique_products
FROM gold.dim_products;

-- find the total number of customers
SELECT COUNT(customer_key) AS total_customers 
FROM gold.dim_customers;

-- find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales;


SELECT 'Total Sales' as measure_name, SUM(sales_amount) AS measure_value 
from gold.fact_sales
UNION ALL
SELECT 'Total Quantity' as measure_name, SUM(quantity) AS measure_value 
FROM gold.fact_sales;
-- and soo on , add everything in single query using "UNION ALL"








