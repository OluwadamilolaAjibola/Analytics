  {{ config ( materialized = 'table') }}

  with source_users as (
    SELECT *
    FROM `bigquery-public-data.thelook_ecommerce.users` 
  )

  select *
  from source_users