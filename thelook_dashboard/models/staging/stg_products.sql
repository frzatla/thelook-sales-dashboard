WITH source AS (
    SELECT
        *
    FROM
        {{ source('thelook_ecommerce', 'products') }}
),

products AS (
    SELECT
        id AS product_id,
        COALESCE(name, 'Unknown Product') AS product_name,
        category,
        department,
        COALESCE(brand, 'Unknown Brand') AS brand,
        cost
    FROM
        source
)

SELECT
    *
FROM
    products