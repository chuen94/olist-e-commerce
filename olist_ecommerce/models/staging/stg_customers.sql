WITH source AS (
    SELECT * FROM {{ source('raw_data', 'RAW_CUSTOMERS') }}
),

renamed AS (
    SELECT * FROM source
)

SELECT * FROM renamed
