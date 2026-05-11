WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

orders AS (
    SELECT * FROM {{ ref('fct_orders') }}
),

geo AS (
    SELECT 
        geolocation_zip_code_prefix,
        AVG(geolocation_lat) as lat,
        AVG(geolocation_lng) as lng
    FROM {{ ref('stg_geolocation') }}
    GROUP BY 1
),

final AS (
    SELECT 
        c.customer_zip_code_prefix,
        c.customer_city,
        c.customer_state,
        g.lat,
        g.lng,
        SUM(o.total_payment_received) as total_revenue,
        COUNT(DISTINCT o.order_id) as total_orders
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN geo g ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
    GROUP BY 1, 2, 3, 4, 5
)

SELECT * FROM final