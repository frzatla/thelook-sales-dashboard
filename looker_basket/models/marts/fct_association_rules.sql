WITH pair_counts AS (
    SELECT
        product_a_category AS item_1,
        product_b_category AS item_2,
        COUNT(order_id) AS pair_frequency
    FROM 
        {{ ref('fct_basket_pairs') }}
    GROUP BY 
        1, 2
),

-- Expand the alphabetical pairs into directed rules (A -> B and B -> A).
directed_pairs AS (
    SELECT 
        item_1 AS base_category, 
        item_2 AS associated_category, 
        pair_frequency 
    FROM 
        pair_counts
    UNION ALL
    SELECT 
        item_2 AS base_category, 
        item_1 AS associated_category, 
        pair_frequency 
    FROM 
        pair_counts
)

SELECT
    dp.base_category,
    dp.associated_category,
    dp.pair_frequency AS times_bought_together,
    
    -- Support, AKA How often this pair occurs across ALL transactions.
    ROUND((dp.pair_frequency / t.total_orders) * 100, 2) AS support_pct,
    
    -- Confidence, AKA How often the associated category is bought when the base category is bought.
    ROUND((dp.pair_frequency / f.category_frequency) * 100, 2) as confidence_pct

FROM 
    directed_pairs dp
CROSS JOIN 
    {{ ref('int_total_orders') }} t
    JOIN {{ ref('int_item_frequencies') }} f
    ON dp.base_category = f.category