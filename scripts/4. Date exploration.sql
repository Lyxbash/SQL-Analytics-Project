/*
SELECT MIN(order_date) as first_order_date,
MAX(order_date) as last_order_date,
DATEDIFF(month, MIN(order_date), MAX(order_date)) as order_range_months
FROM gold.fact_sales;
*/

SELECT	
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) as oldest_age,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) as youngest_age
FROM gold.dim_customers;













