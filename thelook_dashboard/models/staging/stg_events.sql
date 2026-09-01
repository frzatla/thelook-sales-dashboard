WITH source AS (
    SELECT 
        * 
    FROM 
        {{ source('thelook_ecommerce', 'events') }}
),  

events AS (
    SELECT
        id AS event_id,
        user_id,
        session_id,
        created_at,
        event_type
    FROM 
        source
)

SELECT
    *
FROM 
    events

