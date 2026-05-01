WITH source AS (
    SELECT * FROM {{ source('raw_data', 'PRODUCT_CATEGORY_NAME_TRANSLATION') }}
),

renamed AS (
    SELECT * FROM source
)

SELECT * FROM renamed
