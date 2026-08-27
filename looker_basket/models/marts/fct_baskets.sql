SELECT
    order_id,
    total_items,
    basket_value
FROM 
    {{ ref('int_basket_summary') }}