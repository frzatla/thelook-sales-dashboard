SELECT 
    id AS product_id,
    COALESCE(name, 'Unknown Product') as product_name,
    category,
    department
FROM
    {{ source('thelook_ecommerce', 'products') }}
WHERE
    name IS NOT NULL