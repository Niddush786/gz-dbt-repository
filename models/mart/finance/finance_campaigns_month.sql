SELECT
EXTRACT(MONTH from date_date) as by_month,
nb_orders,
operational_margin,
ads_clicks
ads_cost,
ads_impression,
ads_margin,
purchase_cost,
shipping_fee,
log_cost,
ship_cost,
quantity,
revenue,
margin
FROM {{ref('finance_campaigns_day')}}
ORDER BY by_month 