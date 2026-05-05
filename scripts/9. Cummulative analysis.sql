
-- Cummulative Analysis
-- Total sales per month and running total of sales over time

SELECT
order_date, 
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total
FROM
(
SELECT 
DATETRUNC(month, order_date) AS order_date, 
SUM(sales_amount) as total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
) t


-- partitioning such that the running total resets after each year is complete
SELECT
order_date, 
total_sales,
SUM(total_sales) OVER (PARTITION BY YEAR(order_date) ORDER BY order_date) AS running_total
FROM
(
SELECT 
DATETRUNC(month, order_date) AS order_date, 
SUM(sales_amount) as total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
) t



SELECT
order_date, 
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total,
AVG(avg_price) OVER (ORDER BY order_date) AS moving_avg_price
FROM
(
SELECT 
DATETRUNC(year, order_date) AS order_date, 
SUM(sales_amount) as total_sales,
AVG(price) as avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
) t

