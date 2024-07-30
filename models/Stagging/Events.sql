{{ config ( materialized = 'table') }}

with source_events as (
    SELECT  *
    FROM `bigquery-public-data.thelook_ecommerce.events` 
)

select * 
from source_events