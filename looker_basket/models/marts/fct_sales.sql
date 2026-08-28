WITH order_items AS (
    SELECT
        *
    FROM
        {{ ref('stg_order_items') }}
),

products AS (
    SELECT
        *
    FROM 
        {{ ref('stg_products') }}
),

users AS (
    SELECT 
        *
    FROM
        {{ ref('stg_users') }}
),

joined AS (
    SELECT
        oi.order_item_id,
        oi.order_id,
        oi.user_id,
        oi.product_id,
        oi.created_at AS order_created_at,
        oi.sale_price,
        p.cost,
        (oi.sale_price - p.cost) AS gross_profit,
        p.category,
        u.country,
        u.state,
        u.city,
        u.latitude,
        u.longitude
    FROM
        order_items oi
    LEFT JOIN
        products p ON oi.product_id = p.product_id
    LEFT JOIN
        users u ON oi.user_id = u.user_id
    WHERE
        oi.status NOT IN ('Cancelled', 'Returned')
)

SELECT
    *
FROM 
    joined