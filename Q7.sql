--  Get the complete report of the Gross sales amount for the customer  “Atliq 
-- Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
-- high-performing months and take strategic decisions. 
-- The final report contains these columns: 
-- Month 
-- Year 
-- Gross sales Amount


SELECT MONTH(FS.date) AS MONTH,
YEAR(FS.date) AS Year,
 CONCAT(ROUND(SUM(G.gross_price * FS.sold_quantity) / 1000000,
                    2),
            'M') AS Gross_Sales_Amount    
FROM fact_sales_monthly FS 
JOIN dim_customer C 
ON FS.customer_code = C.customer_code
JOIN fact_gross_price G 
ON FS.product_code = G.product_code
WHERE C.customer = 'Atliq Exclusive'
GROUP BY 1,2
ORDER BY Gross_Sales_Amount DESC;











SELECT 
    DATE_FORMAT(FS.date, '%Y %b') AS YearMonth,
    CONCAT(ROUND(SUM(G.gross_price * FS.sold_quantity) / 1000000,
                    2),
            'M') AS Gross_Sales_Amount
FROM
    fact_sales_monthly FS
        JOIN
    dim_customer C ON FS.customer_code = C.customer_code
        JOIN
    fact_gross_price G ON FS.product_code = G.product_code
WHERE
    C.customer = 'Atliq Exclusive'
GROUP BY 1
ORDER BY Gross_Sales_Amount DESC;
 






