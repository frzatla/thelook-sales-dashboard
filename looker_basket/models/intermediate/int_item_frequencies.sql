WITH joined AS
    (
        SELECT
            o.order_id,
            p.category
        FROM 
            {{ ref('stg_order_items') }} o 
        JOIN {{ ref('stg_products') }} p
        ON o.product_id = p.product_id
    )

SELECT
    category,
    COUNT(DISTINCT order_id) AS category_frequency
FROM 
    joined
GROUP BY
    category