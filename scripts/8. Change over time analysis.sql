SELECT
order_date,
SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date is NOT NULL
GROUP BY order_date
ORDER BY order_date



SELECT
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_year,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date is NOT NULL AND YEAR(order_date) = 2012
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)


SELECT
DATETRUNC(year, order_date) AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date is NOT NULL
GROUP BY DATETRUNC(year, order_date) 
ORDER BY DATETRUNC(year, order_date) 
-- similarly can be done for month inside datetrunc as well


-- format or order_date here is string and cannot be sorted (it is sorted by year but not be month as it follows alphabetical order)
SELECT
FORMAT(order_date, 'yyyy-MMM') AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date is NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM')








