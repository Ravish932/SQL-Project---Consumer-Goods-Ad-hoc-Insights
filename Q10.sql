-- 10.  Get the Top 3 products in each division that have a high 
-- total_sold_quantity in the fiscal_year 2021? The final output contains these 
-- fields, 
-- division 
-- product_code 
-- product 
-- total_sold_quantity 
-- rank_order 


WITH CTE AS (
SELECT 
p.division AS Division,
p.product_code AS Product_Code,
p.product AS Product,
SUM(s.sold_quantity) AS Total_Sold_Quantity,
DENSE_RANK() OVER(PARTITION BY Division ORDER BY SUM(s.sold_quantity) DESC) AS Rank_Order
FROM dim_product p 
JOIN fact_sales_monthly s
ON p.product_code = s.product_code
WHERE s.fiscal_year = 2021
GROUP BY p.division, p.product_code, p.product)

SELECT * 
FROM CTE 
WHERE Rank_Order <= 3;

