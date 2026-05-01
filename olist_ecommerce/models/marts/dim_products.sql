WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

translations AS (
    SELECT * FROM {{ ref('stg_product_category_name_translation') }}
),

final_products AS (
    SELECT
        p.product_id,
        COALESCE(t.product_category_name_english, p.product_category_name) AS product_category,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm
    FROM products p
    LEFT JOIN translations t
        ON p.product_category_name = t.product_category_name
)

SELECT * FROM final_products