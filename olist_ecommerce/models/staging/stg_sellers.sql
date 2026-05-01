WITH source AS (
    SELECT * FROM {{ source('raw_data', 'RAW_SELLERS') }}
),

renamed AS (
    SELECT * FROM source
)

SELECT * FROM renamed
