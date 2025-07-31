{{config(materialized)='table'}}

WITH blank AS (
   SELECT
     date_date,
     COUNT(DISTINCT orders_id) AS nb_orders,
     ROUND(SUM(tot_revenue),0) AS revenue,
     ROUND(SUM(margin),0) AS margin,
     ROUND(SUM(operational_margin),0) AS operational_margin,
     ROUND(SUM(tot_purchase_cost),0) AS purchase_cost,
     ROUND(SUM(shipping_fee),0) AS shipping_fee,
     ROUND(SUM(logcost),0) AS log_cost,
     ROUND(SUM(shipping_cost),0) AS ship_cost,
     SUM(tot_quantity) AS quantity
  FROM {{ref("int_orders_operational")}}
  GROUP BY  date_date
  )
Select 
*,
 
 ROUND(NULLIF(revenue/nb_orders,0) ,2) AS average_basket
FROM blank
ORDER BY date_date DESC

