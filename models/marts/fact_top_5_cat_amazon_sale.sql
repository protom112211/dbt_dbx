{{ config(materialized = 'table',
          tags = ['category', 'critical'])}}
--top 5 category and total_amount
with fact 
(
select *
from {{ref('stg_amazon_sale')}}
)
select 
category, 
round(sum(amount) * 1.00 ,2) as total_amount
from fact
group by category
order by total_amount desc
limit 5

;