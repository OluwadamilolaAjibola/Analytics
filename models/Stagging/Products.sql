  {{ config ( materialized = 'table') }}

  with source_products as (
    SELECT *
    FROM `bigquery-public-data.thelook_ecommerce.products`
  )

  select *
  from source_products