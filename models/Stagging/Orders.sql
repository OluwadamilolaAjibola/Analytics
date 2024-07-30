 {{ config ( materialized = 'table') }}

 with source_orders as (
    SELECT *
    FROM `bigquery-public-data.thelook_ecommerce.orders` 
 )

 select *
 from source_orders