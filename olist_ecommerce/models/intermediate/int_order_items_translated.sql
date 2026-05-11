WITH order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

products AS (
    SELECT * FROM {{ ref('dim_products') }}
),

final AS (
    SELECT
        oi.order_id,
        p.product_category
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.product_category IS NOT NULL
)

SELECT * FROM final