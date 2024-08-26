  {{ config ( materialized = 'table') }}

  select
  fc.orderitem_id,
  fc.order_id,
  dp.product_name,
  dp.product_category,
  du. full_name as user_full_name,
  du.country as user_country,
  du.city as user_city,
  du.state as user_state,
  du.postal_code as user_postal_code,
  fc.ordercreationdate,
  fc.quantity,
  fc.product_cost_price,
  fc.cost_per_unit,
  sum(fc.Amount) as total_amount
  
  from {{ ref("fct_order_items")}} as fc
  left join {{ref ("dim_product")}} as dp
  on  fc.product_id = dp.product_id

  left join {{ ref ("dim_users")}} as du
  on fc.user_id = du.user_id
  group by 1,2,3,4,5,6,7,8,9,10,11,12,13