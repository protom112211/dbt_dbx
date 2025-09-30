{{ config(materialized = 'table',
          tags = ['currency', 'critical'])}}
--convert to usd
with fact 
(
select *
from {{ref('stg_amazon_sale')}}
)
select 
*, 
{{ currency_to_usd('currency', 'amount') }} as currency_to_usd

from fact
;