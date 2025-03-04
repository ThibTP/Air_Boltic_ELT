SELECT 
    trip_id, 
    airplane_id, 
    origin_city, 
    destination_city, 
    start_timestamp, 
    end_timestamp,
    CURRENT_DATE AS created_at,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source("airboltic-dwh", "trip") }}
