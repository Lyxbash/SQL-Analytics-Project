--select distinct 
--category 
--from gold.dim_products;

--select distinct
--datediff(year, birthdate, getdate()) as age 
--from gold.dim_customers;


select * from INFORMATION_SCHEMA.tables;

select * from INFORMATION_SCHEMA.columns 
where TABLE_NAME = 'dim_customers';