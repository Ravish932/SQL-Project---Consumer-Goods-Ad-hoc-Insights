-- Q4 Follow-up: Which segment had the most increase in unique products in 
-- 2021 vs 2020? The final output contains these fields, 
-- segment 
-- product_count_2020 
-- product_count_2021 
-- difference 



WITH CTE AS(
SELECT p.segment as segment,
COUNT(DISTINCT CASE WHEN gp.fiscal_year = 2020 THEN p.product_code END) AS unique_product_2020,
COUNT(DISTINCT CASE WHEN gp.fiscal_year = 2021 THEN p.product_code END) AS unique_product_2021
FROM dim_product p 
JOIN fact_gross_price gp
ON p.product_code = gp.product_code
GROUP BY p.segment)

SELECT segment,
 unique_product_2020,
 unique_product_2021,
 (unique_product_2021 - unique_product_2020) AS diffrence
 FROM CTE
 ORDER BY diffrence DESC
 LIMIT 1;













