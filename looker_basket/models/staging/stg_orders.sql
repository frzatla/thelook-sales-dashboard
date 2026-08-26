SELECT
    order_id,
    user_id,
    status as order_status,
    created_at as ordered_at,
    shipped_at,
    delivered_at,
    returned_at

FROM
    {{ source('thelook_ecommerce', 'order_items') }}