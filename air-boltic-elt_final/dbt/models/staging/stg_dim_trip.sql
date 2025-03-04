SELECT 
    trip_id, 
    origin_city, 
    destination_city, 
    airplane_id, 
    start_timestamp, 
    end_timestamp,
    CURRENT_TIMESTAMP AS created_at,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source("airboltic-dwh", "trip") }}
