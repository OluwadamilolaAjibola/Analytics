 {{ config ( materialized = 'table') }}

 select 
 id as event_id,
 user_id,
 sequence_number,
 created_at,
 city,
 state,
 postal_code,
 browser,
 traffic_source,
 event_type

 from {{ ref("Events")}}