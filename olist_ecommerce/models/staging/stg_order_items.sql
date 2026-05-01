WITH raw_order_items AS (
    SELECT * FROM {{ source('raw_data', 'RAW_ORDER_ITEMS') }}
),

renamed_and_casted AS (
    SELECT
        order_id,
        order_item_id,
        product_id,
        seller_id,
        CAST(shipping_limit_date AS TIMESTAMP) AS shipping_limit_at,
        price,
        freight_value

    FROM raw_order_items
)

SELECT * FROM renamed_and_casted