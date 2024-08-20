{{ config ( materialized = 'table')}}

WITH last_order AS (
    SELECT 
        dor.user_id, 
        MAX (date(dor.created_at)) AS last_order_date
    FROM 
        {{ ref ("dim_orders")}} dor
    GROUP BY 
        dor.user_id
)
SELECT 
    COUNT(CASE WHEN last_order_date < current_date - INTERVAL 6 month THEN 1 END) AS churned_customers,
    COUNT(user_id) AS total_customers,
    (COUNT(CASE WHEN last_order_date < current_date - INTERVAL 6 month THEN 1 END) * 100.0 / COUNT(user_id)) AS churn_rate
FROM 
    last_order
