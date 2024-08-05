 {{ config (materialized = 'table')}}
  

 select
 oi.id as orderitem_id,
 oi.order_id as order_id,
 oi.user_id as user_id,
 oi.product_id as product_id,
 oi.inventory_item_id as inventory_id,
 oi.status as order_status,
 oi.created_at as ordercreationdate,
 oi.shipped_at as ordershippeddate,
 oi.delivered_at as deliverydate,
 oi.returned_at as order_return_date,
 p.cost as product_cost_price,
 p.retail_price as product_retail_price,
 oi.sale_price as cost_per_unit,
 o.num_of_item as quantity,
 sum(oi.sale_price * o.num_of_item) as Amount,
 p.distribution_center_id as distribution_center_id

 from {{ref("Order_items")}}as oi 
 left join {{ref("Orders")}} as o
 on oi.order_id = o.order_id

 left join {{ref("Products")}} as p
 on oi.product_id = p.id
 
 group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,16