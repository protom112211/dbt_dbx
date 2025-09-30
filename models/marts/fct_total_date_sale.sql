{{ config(materialized = 'table')}}

with fact as (
select *
from {{ref('stg_amazon_sale')}}
)
select date, sum(amount) as total_amount
from fact
group by date
order by date
;