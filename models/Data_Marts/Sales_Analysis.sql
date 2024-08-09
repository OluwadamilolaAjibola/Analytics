  {{ config ( materialized = 'table')}}

  select
  dor.order_id,
  fc.Amount,
  dor.created_at,
  dc.center_name as distribution_center,
  dp.product_name,
  du.country

  from 
  {{ref("dim_orders")}} as dor
  join
  {{ref("fct_order_items")}} as fc
  on dor.order_id = fc.order_id

  join
  {{ref("dim_product")}} ad dp
  on dp.product_id = fc.product_id

  join
  {{ref("dim_users")}} as du
  on du.user_id = fc.user_id

  join
  {{ref("dim_distribution_centers")}} as dc
  on dc.distribution_id = fc.distribution_center_id