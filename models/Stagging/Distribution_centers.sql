{{config (materialized = 'table') }}

with source_distribution_centers as (
     SELECT * 
     FROM `bigquery-public-data.thelook_ecommerce.distribution_centers` 
)

select *
from source_distribution_centers