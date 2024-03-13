-- 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
-- 					unique_products_2020
-- 				   unique_products_2021
-- 					percentage_chg

select A.X as Unique_product_2020 , B.Y as Unique_product_2021 , (Y - X)*100/X as percentage_chg  
from
 ((select count( distinct product_code) as X from fact_sales_monthly where fiscal_year = 2020) A ,
(select count( distinct product_code) as Y from fact_sales_monthly where fiscal_year = 2021) B);

