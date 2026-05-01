WITH source AS (
    SELECT * FROM {{ source('raw_data', 'RAW_GEOLOCATION') }}
),

renamed AS (
    SELECT * FROM source
)

SELECT * FROM renamed
