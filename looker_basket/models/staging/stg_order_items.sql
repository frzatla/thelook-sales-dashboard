SELECT
    id AS order_item_id,
    order_id,
    product_id
FROM 
    {{ source('thelook_ecommerce', 'order_items') }}