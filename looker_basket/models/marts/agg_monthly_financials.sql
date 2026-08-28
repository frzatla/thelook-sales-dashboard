WITH sales AS (
        SELECT
            *
        FROM 
            {{ ref('fct_sales') }}
),

aggregated AS (
    SELECT
        DATE_TRUNC(order_created_at, month) AS order_month,
        category,
        country,
        state,
        COUNT(order_item_id) AS quantity_sold,
        SUM(sale_price) AS total_sales,
        SUM(gross_profit) AS total_gross_profit
    FROM 
        sales
    GROUP BY 
        1, 2, 3, 4
)

SELECT
    *
FROM
    aggregated
