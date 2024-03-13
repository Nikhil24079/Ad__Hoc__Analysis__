/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

with cte1 as 
(
select 
	p.segment as pp  , count(distinct f.product_code) as cnt
from fact_sales_monthly f 
join dim_product p 
on
	p.product_code = f.product_code
where fiscal_year = 2020  
group by p.segment , f.fiscal_year
),
cte2 as (
select 
	p.segment as rr , count(distinct f.product_code) as cnt2
from fact_sales_monthly f 
join dim_product p 
on
	p.product_code = f.product_code
where fiscal_year = 2021
group by p.segment , f.fiscal_year
)
select cte1.pp as segment , cte1.cnt as unqiue_product_2020 , cte2.cnt2 as unqiue_product_2021, (cte2.cnt2 - cte1.cnt) as difference 
from cte1,cte2 
where cte1.pp = cte2.rr;
