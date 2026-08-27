SELECT
    COUNT(DISTINCT order_id) as total_orders
FROM
    {{ ref('stg_order_items') }}