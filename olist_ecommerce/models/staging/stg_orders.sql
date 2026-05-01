WITH raw_orders AS (
    SELECT * FROM {{ source('raw_data', 'RAW_ORDERS') }}
),

renamed_and_casted AS (
    SELECT
        order_id,
        customer_id,
        order_status,
        CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_at,
        CAST(order_approved_at AS TIMESTAMP) AS order_approved_at,
        CAST(order_delivered_carrier_date AS TIMESTAMP) AS order_delivered_carrier_at,
        CAST(order_delivered_customer_date AS TIMESTAMP) AS order_delivered_customer_at,
        CAST(order_estimated_delivery_date AS TIMESTAMP) AS order_estimated_delivery_at
        
    FROM raw_orders
)

SELECT * FROM renamed_and_casted