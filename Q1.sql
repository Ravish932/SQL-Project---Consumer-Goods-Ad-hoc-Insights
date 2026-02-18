-- What is the percentage of unique product increase in 2021 vs. 2020? The 
-- final output contains these fields, 
-- unique_products_2020 
-- unique_products_2021 
-- percentage_chg 


WITH CTE AS(
SELECT
COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN product_code END) AS unique_product_2020,
COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN product_code END) AS unique_product_2021
FROM fact_sales_monthly)

SELECT
unique_product_2020,
unique_product_2021,
CONCAT(ROUND(((unique_product_2021 - unique_product_2020) * 100 / unique_product_2020),2),"%") AS percentage_change
FROM CTE 



















