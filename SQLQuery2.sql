
--top 10 highest revenue products
select top 10 product_id,sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc

--top 5 highest selling products in each region
with cte as(select  region, product_id, sum(sale_price) as sales
from df_orders
group by region,product_id
)
SELECT *
FROM (select *,
ROW_NUMBER() over(partition by region order by sales desc) as n
from cte) as a
where n<=5

--month over month growth 2022 and 2023
with c as
(select year(order_date) as sale_year,month(order_date) as sale_month,
sum(sale_price) as sales
from df_orders
group by year(order_date),month(order_date)
)
SELECT sale_month
,sum(case when sale_year=2022 then sales else 0 end)  as sales_2022
,sum(case when sale_year=2023 then sales else 0 end) as sales_2023
from c
group by sale_month
order by sale_month desc

--heigest sale of the month based on category 
with e as (select category,format(order_date,'yyyyMM') as order_year_month,
sum(sale_price) as total_sale_price
from df_orders
group by category,format(order_date,'yyyyMM') )

select*
from(select *,
row_number() over(partition by category order by total_sale_price desc) as rn 
from e) a
where rn=1

-- which subcategory is highest growth 
with c as
(select sub_category,year(order_date) as sale_year,
sum(sale_price) as sales
from df_orders
group by sub_category,year(order_date))

, c2 as(
SELECT sub_category
,sum(case when sale_year=2022 then sales else 0 end)  as sales_2022
,sum(case when sale_year=2023 then sales else 0 end) as sales_2023
from c
group by sub_category
)
SELECT top 3 *,
(sales_2023-sales_2022)*100/sales_2022  as growth 
from c2
order by growth desc


