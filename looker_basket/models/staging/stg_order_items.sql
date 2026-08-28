WITH source AS (
    SELECT
        *
    FROM 
        {{ source('thelook_ecommerce', 'order_items') }}
),

orders AS (
    SELECT
        id AS order_item_id,
        order_id,
        product_id,
        sale_price
    FROM
        source
)

SELECT
    *
FROM 
    orders