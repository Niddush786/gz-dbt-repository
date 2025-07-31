SELECT
EXTRACT(MONTH from date_date) as by_month,
SUM(nb_orders)AS nb_orders,
SUM(operational_margin) AS operational_margin,
SUM(ads_clicks) AS ads_clicks,
SUM(ads_cost) AS ads_cost,
SUM(ads_impression) AS ads_impression,
SUM(ads_margin) AS ads_margin,
SUM(purchase_cost) AS purchase_cost,
SUM(shipping_fee) AS shipping_fee,
SUM(log_cost) AS log_cost,
SUM(ship_cost) AS ship_cost,
SUM(quantity) AS quantity,
SUM(revenue) AS revenue,
SUM(margin) AS margin
FROM {{ref('finance_campaigns_day')}}
GROUP BY by_month
ORDER BY by_month 