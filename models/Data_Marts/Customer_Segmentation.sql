{{ config ( materialized = 'table')}}

SELECT 
    du.user_id, 
    COUNT(dor.order_id) AS order_count, 
    fc.Amount
FROM 
    {{ ref ("dim_users")}} du 
JOIN 
    {{ ref ("dim_orders")}} dor ON du.user_id = dor.user_id
JOIN 
    {{ ref ("fct_order_items")}} fc ON dor.order_id = fc.order_id

GROUP BY
      1,3
ORDER BY 
    3 DESC
