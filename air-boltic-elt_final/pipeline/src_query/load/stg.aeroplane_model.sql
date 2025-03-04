--
--- Query for load data and handling new data (upsert) from db sources into staging schema in DWH
--

INSERT INTO airboltic_dwh_staging.aeroplane_model
    (manufacturer, airplane_model, max_seats, max_weight, max_distance, engine_type)

SELECT
    manufacturer,
    airplane_model,
    max_seats,
    max_weight,
    max_distance,
    engine_type
FROM raw.aeroplane_model

ON CONFLICT (airplane_model)
DO UPDATE SET
    manufacturer = EXCLUDED.manufacturer,
    max_seats = EXCLUDED.max_seats,
    max_weight = EXCLUDED.max_weight,
    max_distance = EXCLUDED.max_distance,
    engine_type = EXCLUDED.engine_type,
    updated_at = CASE WHEN 
                        airboltic_dwh_staging.aeroplane_model.manufacturer <> EXCLUDED.manufacturer
                        OR airboltic_dwh_staging.aeroplane_model.max_seats <> EXCLUDED.max_seats
                        OR airboltic_dwh_staging.aeroplane_model.max_weight <> EXCLUDED.max_weight
                        OR airboltic_dwh_staging.aeroplane_model.max_distance <> EXCLUDED.max_distance
                        OR airboltic_dwh_staging.aeroplane_model.engine_type <> EXCLUDED.engine_type
                      THEN CURRENT_TIMESTAMP
                      ELSE airboltic_dwh_staging.aeroplane_model.updated_at
                END;