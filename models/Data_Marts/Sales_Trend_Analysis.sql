{{ config ( materialized = 'table')}}

SELECT 
    DATE_TRUNC(dor.created_at, month) AS month, 
    fc.Amount
FROM 
   {{ ref("dim_orders") }} dor
JOIN 
    {{ ref ("fct_order_items")}} fc ON dor.order_id = fc.order_id
ORDER BY 
    1
