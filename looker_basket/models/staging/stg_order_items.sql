SELECT
    id AS product_id,
    order_id,
    product_id
FROM 
    {{ source('thelook_ecommerce', 'order_items') }}