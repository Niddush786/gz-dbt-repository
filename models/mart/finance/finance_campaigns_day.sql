WITH blank AS (
SELECT
f.date_date,
nb_orders,
f.operational_margin AS operational_margin,
c.ads_cost AS ads_cost,
c.impression AS ads_impression,
c.clicks AS ads_clicks,
f.purchase_cost AS purchase_cost,
f.shipping_fee AS shipping_fee,
f.log_cost AS log_cost,
f.ship_cost AS ship_cost,
f.quantity AS quantity,
f.revenue AS revenue,
f.margin AS margin
FROM {{ref('finance_days')}} AS f   
JOIN {{ref('int_campaign_day')}} AS c
USING(date_date)
)

SELECT
*,
ROUND(NULLIF(revenue/nb_orders,0),2) AS ads_margin
FROM blank
ORDER BY date_date DESC