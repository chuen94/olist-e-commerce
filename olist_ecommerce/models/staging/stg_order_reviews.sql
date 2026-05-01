WITH source AS (
    SELECT * FROM {{ source('raw_data', 'RAW_ORDER_REVIEWS') }}
),

renamed AS (
    SELECT * FROM source
)

SELECT * FROM renamed
