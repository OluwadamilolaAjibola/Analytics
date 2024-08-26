{{ config ( materialized = 'table')}}

SELECT 
    DATE_TRUNC(dor.created_at, month) AS month, 
    sum(fc.Amount) as total_amount
FROM 
   {{ ref("dim_orders") }} dor
JOIN 
    {{ ref ("fct_order_items")}} fc ON dor.order_id = fc.order_id

GROUP BY 1
ORDER BY 
    1
