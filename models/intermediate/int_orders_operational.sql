select
orders.orders_id,
orders.date_date,
orders.tot_purchase_cost,
orders.tot_quantity,
orders.tot_revenue,
ship.shipping_fee,
ship.shipping_cost,
ship.logcost,
ROUND(orders.margin +(ship.shipping_fee-(ship.logcost+ship.shipping_cost)),2) AS operational_margin
FROM {{ref("int_orders_margin")}} AS orders
LEFT JOIN {{ref("stg_raw__ship")}} AS ship 
USING (orders_id)
ORDER BY orders_id DESC


