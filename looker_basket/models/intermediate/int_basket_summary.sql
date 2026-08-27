SELECT
    order_id,
    COUNT(order_item_id) AS total_items,
    SUM(sale_price) AS basket_value
FROM 
    {{ ref('stg_order_items') }}
GROUP BY 
    order_id