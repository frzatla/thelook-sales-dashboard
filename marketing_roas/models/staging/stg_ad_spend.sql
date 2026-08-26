SELECT
    date as spend_date,
    campaign_id,
    channel,
    daily_spend,
    impressions,
    clicks
FROM 
    {{ source('raw_marketing', 'ad_spend') }}