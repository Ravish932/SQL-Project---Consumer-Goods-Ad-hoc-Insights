-- 9.  Which channel helped to bring more gross sales in the fiscal year 2021 
-- and the percentage of contribution?  The final output  contains these fields, 
-- channel 
-- gross_sales_mln 
-- percentage

 
WITH CTE AS (
    SELECT
        c.channel AS Channel,
        SUM(p.gross_price * s.sold_quantity) / 1000000 AS Gross_Sales_Mln
    FROM dim_customer c
    JOIN fact_sales_monthly s 
        ON c.customer_code = s.customer_code 
    JOIN fact_gross_price p 
        ON p.product_code = s.product_code
    WHERE s.fiscal_year = 2021
    GROUP BY c.channel
)

SELECT
    Channel,
    CONCAT(ROUND(Gross_Sales_Mln, 2), 'M') AS gross_sales_mln,
    ROUND(
        (Gross_Sales_Mln / (SELECT SUM(Gross_Sales_Mln) FROM CTE)) * 100,
        2
    ) AS percentage
FROM CTE
ORDER BY Gross_Sales_Mln DESC;










