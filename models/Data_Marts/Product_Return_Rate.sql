{{ config ( materialized = 'table')}}

SELECT 
    dp.product_name, 
    SUM(CASE WHEN fc.order_return_date IS NOT NULL THEN 1 ELSE 0 END) AS total_returns, 
    COUNT(fc.orderitem_id) AS total_sold, 
    (SUM(CASE WHEN fc.order_return_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(fc.orderitem_id)) * 100 AS return_rate
FROM 
    {{ ref ("fct_order_items")}} fc
JOIN 
    {{ ref ("dim_product")}} dp ON fc.product_id = dp.product_id
GROUP BY 
    dp.product_name
ORDER BY 
    return_rate DESC
