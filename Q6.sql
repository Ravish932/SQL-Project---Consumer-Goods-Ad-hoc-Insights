

-- Q6 Generate a report which contains the top 5 customers who received an 
-- average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
-- Indian  market. The final output contains these fields, 
-- customer_code 
-- customer 
-- average_discount_percentage 



SELECT 
    c.customer_code AS Customer_Code,
    c.customer AS customer,
    ROUND(AVG(p.pre_invoice_discount_pct) * 100, 2) AS AVG_Discount_Pct
FROM
    dim_customer c
        JOIN
    fact_pre_invoice_deductions p ON c.customer_code = p.customer_code
WHERE
    p.fiscal_year = 2021
        AND c.market = 'India'
GROUP BY c.customer_code , c.customer
ORDER BY AVG_Discount_Pct DESC
LIMIT 5;
