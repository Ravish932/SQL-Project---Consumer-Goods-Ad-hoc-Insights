
-- 1.  Provide the list of markets in which customer  "Atliq  Exclusive"  operates its 
-- business in the  APAC  region. 



SELECT 
    customer, market, region
FROM
    dim_customer
WHERE
    region = 'APAC'
