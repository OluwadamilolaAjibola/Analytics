 {{ config ( materialized = 'table') }}

 with source_inventory_items as (
    SELECT *
    FROM `bigquery-public-data.thelook_ecommerce.inventory_items`
 )

 select * 
 from source_inventory_items