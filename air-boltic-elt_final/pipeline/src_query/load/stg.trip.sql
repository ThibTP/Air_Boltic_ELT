--
--- Query for load data and handling new data (upsert) from db sources into staging schema in DWH
--

INSERT INTO airboltic_dwh_staging.trip
    (trip_id, origin_city, destination_city, airplane_id, start_timestamp, end_timestamp)

SELECT
    trip_id,
    airplane_id,
    origin_city,
    destination_city,
    start_timestamp,
    end_timestamp
FROM raw.trip

ON CONFLICT (trip_id)
DO UPDATE SET
    airplane_id = EXCLUDED.airplane_id,
    origin_city = EXCLUDED.origin_city,
    destination_city = EXCLUDED.destination_city,
    start_timestamp = EXCLUDED.start_timestamp,
    end_timestamp = EXCLUDED.end_timestamp,
    updated_at = CASE WHEN 
    
                        airboltic_dwh_staging.trip.airplane_id <> EXCLUDED.airplane_id
                        OR airboltic_dwh_staging.trip.origin_city <> EXCLUDED.origin_city
                        OR airboltic_dwh_staging.trip.destination_city <> EXCLUDED.destination_city
                        OR airboltic_dwh_staging.trip.start_timestamp <> EXCLUDED.start_timestamp
                        OR airboltic_dwh_staging.trip.end_timestamp <> EXCLUDED.end_timestamp
                      THEN CURRENT_TIMESTAMP
                      ELSE airboltic_dwh_staging.trip.updated_at
                END;
