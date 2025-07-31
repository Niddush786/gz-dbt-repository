SELECT
date_date,
campaign_key,
campaign_name,
SUM(ads_cost) AS ads_cost,
SUM(impression)AS impressions,
SUM(click) AS clicks
FROM {{ref('int_campaigns')}}
GROUP BY date_date,campaign_key
ORDER BY date_date
