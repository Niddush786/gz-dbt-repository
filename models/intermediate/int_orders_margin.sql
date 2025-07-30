SELECT
orders_id,
date_date,
ROUND(SUM(revenue),2) AS tot_revenue,
ROUND(SUM(quantity),2) AS tot_quantity,
ROUND(SUM(purchase_cost),2) AS tot_purchase_cost,
ROUND(SUM(margin),2) as margin
FROM {{ ref("int_sales_margin") }}
 GROUP BY orders_id,date_date
 ORDER BY orders_id DESC
