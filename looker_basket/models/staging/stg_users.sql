WITH source AS (
    SELECT
        *
    FROM
        {{ source('thelook_ecommerce', 'users') }}
),

renamed AS (
    SELECT
        id AS user_id,
        state,
        city,
        country,
        latitude,
        longitude,
        created_at AS user_created_at
    FROM 
        source
)

SELECT
    *
FROM
    renamed