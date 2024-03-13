/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

with cte1  as (
Select 
	c.channel , round(sum(f.sold_quantity*g.gross_price)/1000000,2) as gross_sales_mln
from fact_sales_monthly f 
join dim_customer c 
on 
	c.customer_code = f.customer_code
join fact_gross_price g 
on 
	g.product_code = f.product_code 
where f.fiscal_year = 2021    
group by c.channel    
)
select * , 
concat(round(gross_sales_mln*100/sum(gross_sales_mln) over() ,2) , '%')  as percentage

from cte1
order by percentage desc;
