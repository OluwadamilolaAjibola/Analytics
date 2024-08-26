{{ config ( materialized = 'table')}}

select 
du.user_id,
du.full_name,
du.age,
du.gender,
du.country,
sum(fc.Amount) as total_amount,
count (dor.order_id) as total_orders,
case 
   when date(dor.created_at) < current_date - interval 6 month then 'At Risk'
   else 'Active'
end as customer_status

from 
   {{ref("dim_users")}} as du

   join
   {{ref("fct_order_items")}} as fc
   on du.user_id = fc.user_id

   join
   {{ref("dim_orders")}} as dor
   on dor.order_id = fc.order_id

group by 1,2,3,4,5,8