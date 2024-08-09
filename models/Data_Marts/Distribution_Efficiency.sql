  {{ config( materialized = 'table')}}

  select
dor.order_id,
dd.center_name as distribution_center,
timestampdiff (day, dor.created_at, fc.ordershippeddate) as fulfilment_time,
timestampdiff (day, fc.ordershippeddate, fc.deliverydate) as delivery_time,
case
   when fc.order_status = 'Complete' then 'On Time',
   when fc.order_status = 'shipped' then 'In Progress',
   when fc.order_status = 'processing' then 'Delayed'
   else 'cancelled'
   end as delivery_status

   from {{ ref("dim_orders")}} as dor
   join

   {{ ref("fct_order_items")}} as fc 
   on o.order_id = fc.order_id

   join
   {{ref("dim_distribution_centers")}} as dd
   on dd.distribution_id = fc.distribution_center_id
