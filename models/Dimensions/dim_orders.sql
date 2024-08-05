  {{ config ( materialized = 'table') }}

  select 
  order_id,
  user_id,
  status,
  gender,
  created_at,
  shipped_at,
  num_of_item

  from {{ref("Orders")}}
