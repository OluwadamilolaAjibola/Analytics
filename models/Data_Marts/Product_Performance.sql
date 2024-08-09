  {{ config ( materialized = 'table')}}

  select 
  dp.product_name,
  count (fc.orderitem_id) as total_orders,
  fc.Amount as total_revenue,
  sum( case when fc.order_return_date is not null then 1 else 0 end) as total_returns,
  round(fc.Amount/ count(fc.orderitem_id), 2) as Avg_order_value

  from {{ref("dim_product")}} as dp
  join {{ref("fct_order_items")}} as fc 
  on fc.product_id =  dp.product_id

  group by 1,3
  
