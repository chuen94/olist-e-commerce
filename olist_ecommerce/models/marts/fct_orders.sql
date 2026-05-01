WITH enriched_orders AS (
    SELECT * FROM {{ ref('int_orders_enriched') }}
),

payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS total_payment_received,
        COUNT(payment_sequential) AS number_of_payments,
        MODE(payment_type) AS primary_payment_type 
    FROM {{ ref('stg_order_payments') }}
    GROUP BY 1
),

final_orders AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_at,
        o.total_items,
        o.total_product_revenue,
        o.total_freight_revenue,
        o.total_order_value,
        
        p.total_payment_received,
        p.primary_payment_type,
        
        CASE 
            WHEN o.total_order_value > p.total_payment_received THEN TRUE 
            ELSE FALSE 
        END AS is_underpaid
        
    FROM enriched_orders o
    LEFT JOIN payments p 
        ON o.order_id = p.order_id
)

SELECT * FROM final_orders