WITH order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

users AS (
    SELECT * FROM {{ ref('stg_users') }}
),

-- Figure out the order in which each customer placed their orders.
order_sequence AS (
    SELECT
        order_id,
        user_id,
        MIN(created_at) AS order_placed_at
    FROM order_items
    GROUP BY 1, 2
),

order_ranks AS (
    SELECT
        order_id,
        user_id,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY order_placed_at) AS order_rank
    FROM order_sequence
),

joined AS (
    SELECT
        oi.order_item_id,
        oi.order_id,
        oi.user_id,
        oi.product_id,
        oi.status,                              
        oi.created_at AS order_created_at,
        oi.sale_price,
        p.cost,
        (oi.sale_price - p.cost) AS gross_profit,
        p.category,
        p.brand,
        p.product_name,
        u.country,
        u.state,
        u.city,
        u.latitude,
        u.longitude,
        u.traffic_source,
        CASE 
            WHEN r.order_rank = 1 THEN 'New' 
            ELSE 'Returning' 
        END AS customer_type
    FROM order_items oi
    LEFT JOIN products p ON oi.product_id = p.product_id
    LEFT JOIN users u ON oi.user_id = u.user_id
    LEFT JOIN order_ranks r 
        ON oi.order_id = r.order_id AND oi.user_id = r.user_id
)

SELECT 
    * 
FROM 
    joined