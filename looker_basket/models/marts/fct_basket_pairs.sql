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
),

joined_products AS (
    SELECT
        bp.order_id,
        p1.product_name AS p1_name,
        p1.category AS p1_category,
        p2.product_name AS p2_name,
        p2.category AS p2_category
    FROM 
        basket_pairs bp
    JOIN {{ ref('stg_products') }} p1 
        ON bp.product_a_id = p1.product_id
    join {{ ref('stg_products') }} p2 
        ON bp.product_b_id = p2.product_id
)

SELECT
    order_id,
    -- Sort names based on which category comes first alphabetically.
    CASE WHEN
        p1_category <= p2_category THEN p1_name ELSE p2_name END AS product_a_name,
        LEAST(p1_category, p2_category) AS product_a_category,
    
    CASE WHEN
        p1_category <= p2_category THEN p2_name ELSE p1_name END AS product_b_name,
        GREATEST(p1_category, p2_category) AS product_b_category
FROM 
    joined_products