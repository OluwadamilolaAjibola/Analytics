 {{ config (materialized = 'table') }}

 with source_order_items as (
    SELECT *
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
 )

 select * 
 from source_order_items