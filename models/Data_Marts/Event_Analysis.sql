  {{ config ( materialized = 'table') }}

  select 
  de.event_id,
  de.event_type,
  de.state as event_state,
  de.traffic_source,
  de.browser,
  count(distinct du.user_id) as participant,
  fc.Amount as event_sales

  from {{ref("dim_events")}} as de

  left join {{ref("dim_users")}} as du
  on de.user_id = du.user_id

  left join {{ref("fct_order_items")}} as fc 
  on fc.event_id = de.event_id

  group by 1,2,3,4,5,7
