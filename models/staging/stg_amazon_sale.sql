{{config(materialized = 'view',
         tags = ['sales', 'critical'])}}

with source as
(
select *
from {{ source('dbx_sources', 'amazon_sale')}}
),

stg_amazon_sale as
(
select

index,
`Order ID` as order_id,
Date as date,
Status as status,
Fulfilment as fulfilment,
`Sales Channel ` as sales_channel,
`ship-service-level` as ship_service_level,
Style as style,
SKU as sku,
Category as category,
Size as size,
ASIN as asin,
`Courier Status` as courier_status,
Qty as qty,
currency,
Amount as amount,
`ship-city` as ship_city,
`ship-state` as ship_state,
`ship-postal-code` as ship_postal_code,
`ship-country` as ship_country

from source
limit 10
)

select *
from stg_amazon_sale;