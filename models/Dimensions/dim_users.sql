  {{config (materialized = 'table') }}

  select 
  id as user_id,
  first_name,
  last_name,
  concat (first_name, '', last_name) as full_name,
  age,
  gender,
  state,
  postal_code,
  city,
  country,
  latitude,
  longitude,
  traffic_source,
  created_at

  from {{ ref("Users")}}