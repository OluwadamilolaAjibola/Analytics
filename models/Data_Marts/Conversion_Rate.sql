  {{config (materialized = 'table') }}
  SELECT 
    de.traffic_source,
    COUNT(fc.order_status) AS total_orders,
    SUM(CASE 
        WHEN fc.order_status IN ('Shipped', 'Complete') THEN 1 
        ELSE 0 
    END) AS converted_orders,
    ROUND(SUM(CASE 
        WHEN fc.order_status IN ('Shipped', 'Complete') THEN 1 
        ELSE 0 
    END) * 100.0 / COUNT(fc.order_status), 2) AS conversion_rate

FROM {{ref("fct_order_items")}} as fc

left join {{ref("dim_events")}} as de 
on fc.event_id = de.event_id

GROUP BY 1
