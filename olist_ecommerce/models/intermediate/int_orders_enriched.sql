WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

order_totals AS (
    SELECT 
        order_id,
        COUNT(order_item_id) AS total_items,
        SUM(price) AS total_product_revenue,
        SUM(freight_value) AS total_freight_revenue,
        SUM(price + freight_value) AS total_order_value
    FROM order_items
    GROUP BY 1
),

enriched_orders AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_at,
        t.total_items,
        t.total_product_revenue,
        t.total_freight_revenue,
        t.total_order_value
    FROM orders o
    LEFT JOIN order_totals t 
        ON o.order_id = t.order_id
)

SELECT * FROM enriched_orders