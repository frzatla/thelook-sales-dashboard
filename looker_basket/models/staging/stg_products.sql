SELECT 
    id AS product_id,
    name AS product_name, 
    category,
    department
FROM
    {{ source('thelook_ecommerce', 'products') }}
WHERE
    name IS NOT NULL