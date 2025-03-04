SELECT 
    t.trip_id, 
    t.airplane_id, 
    d.origin_city, 
    d.destination_city, 
    t.start_timestamp, 
    t.end_timestamp,
    CURRENT_TIMESTAMP AS created_at,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source("airboltic-dwh", "trip") }} t
LEFT JOIN {{ source("airboltic-dwh", "aeroplane") }} a
    ON t.airplane_id = a.airplane_id
