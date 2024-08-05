 {{ config ( materialized ='table') }}

 select
 id as distribution_id,
 name as center_name,
 longitude,
 latitude

 from {{ ref("Distribution_centers")}}