

-- 8.  In which quarter of 2020, got the maximum total_sold_quantity? The final 
-- output contains these fields sorted by the total_sold_quantity, 
-- Quarter 
-- total_sold_quantity




SELECT 
    QUARTER(date) AS Quarter,
    CONCAT(SUM(sold_quantity) / 1000000, 'M') AS Sold_Quantity
FROM
    fact_sales_monthly
GROUP BY QUARTER(date)
ORDER BY Sold_Quantity;

