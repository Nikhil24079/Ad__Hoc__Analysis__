/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

select 
	CONCAT(MONTHNAME(f.date), ' (', YEAR(f.date), ')') as Month
    , f.fiscal_year as Year ,
    round(sum(f.sold_quantity*g.gross_price),2) as Gross_sales_amount

from fact_sales_monthly f 
join dim_customer c 
on 
		c.customer_code = f.customer_code
join fact_gross_price g 
on 
	g.product_code = f.product_code
where c.customer = 'Atliq Exclusive'
group by Month , f.date 
order by f.date asc   
   ;
