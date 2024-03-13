/*6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/

select 
		c.customer_code , c.customer ,
      round(avg(f.pre_invoice_discount_pct)*100,4) as avg_discount_percentage
from fact_pre_invoice_deductions f 
join dim_customer c 
on 
		c.customer_code = f.customer_code 
where fiscal_year = 2021 and market = "India"         
group by c.customer , c.customer_code 
order by f.pre_invoice_discount_pct desc
limit 5;
