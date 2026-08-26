import pandas as pd
import numpy as np
from datetime import datetime


np.random.seed(42)
start_date = datetime(2024, 1, 1)
end_date = datetime(2026, 8, 25)
date_range = pd.date_range(start = start_date, end = end_date, freq = 'D')

# For the marketing campaigns & baseline spending profiles.
campaigns = [
    {
        "campaign_id": "CAMP_GOOG_SEARCH_01",
        "channel": "Search",
        "base_spend": 250,
        "std_spend": 45
    },
    {
        "campaign_id": "CAMP_FB_PROMO_01",
        "channel": "Organic Social",
        "base_spend": 180,
        "std_spend": 35
    },
    {
        "campaign_id": "CAMP_IG_REELS_01",
        "channel": "Display",
        "base_spend": 130,
        "std_spend": 25
    },
    {
        "campaign_id": "CAMP_TIKTOK_BRAND_01",
        "channel": "Social",
        "base_spend": 110,
        "std_spend": 30
    },
    {
        "campaign_id": "CAMP_EMAIL_RETARGET_01",
        "channel": "Email",
        "base_spend": 40,
        "std_spend": 10
    }
]

records = []

