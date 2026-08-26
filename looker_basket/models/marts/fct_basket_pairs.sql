WITH basket_pairs AS (
    SELECT
        a.order_id,
        a.product_id AS product_a_id,
        b.product_id AS product_b_id
    FROM 
        {{ ref('stg_order_items') }} a 
        JOIN {{ ref ('stg_order_items') }} b 
            ON a.order_id = b.order_id
            AND a.product_id < b.product_id
)

SELECT
    bp.order_id,
    p1.product_name AS product_a_name,
    p1.category AS product_a_category,
    p2.product_name AS product_b_name,
    p2.category AS product_b_category
FROM 
    basket_pairs bp
JOIN {{ ref('stg_products') }} p1 
    ON bp.product_a_id = p1.product_id
join {{ ref('stg_products') }} p2 
    ON bp.product_b_id = p2.product_id