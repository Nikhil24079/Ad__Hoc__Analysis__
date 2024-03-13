-- Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.
SELECT  
	 distinct market
   
FROM gdb023.dim_customer
where region = "APAC" and
customer = "atliq exclusive" 
order by market asc;
