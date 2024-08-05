 {{ config ( materialized = 'table') }}

 select
 id as product_id,
 name as product_name,
 category as product_category,
 brand as product_brand,
 department,
 sku,
 distribution_center_id
 from {{ref("Products")}}

