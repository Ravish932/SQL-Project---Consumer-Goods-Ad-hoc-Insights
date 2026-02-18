 -- Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields, 
-- product_code 
-- product 
--  manufacturing_cost


WITH CTE AS(
SELECT p.product_code, p.product, c.manufacturing_cost,
ROW_NUMBER() OVER(ORDER BY c.manufacturing_cost) as rn
FROM dim_product p 
JOIN fact_manufacturing_cost c
ON p.product_code = c.product_code
ORDER BY c.manufacturing_cost)



SELECT 
p.product_code as Product_Code,
p.product as Product,
c.manufacturing_cost as Manufacturing_Cost
FROM dim_product p 
JOIN fact_manufacturing_cost c 
ON p.product_code = c.product_code
WHERE c.manufacturing_cost IN(
SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
UNION
SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;
