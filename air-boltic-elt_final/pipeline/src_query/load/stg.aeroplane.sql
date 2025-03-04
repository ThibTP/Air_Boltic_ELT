--
--- Query for load data and handling new data (upsert) from db sources into staging schema in DWH
--


INSERT INTO airboltic_dwh_staging.aeroplane
    (airplane_id, airplane_model, manufacturer)

SELECT
    airplane_id,
    airplane_model,
    manufacturer
FROM raw.aeroplane

ON CONFLICT (airplane_id)
DO UPDATE SET
    airplane_model = EXCLUDED.airplane_model,
    manufacturer = EXCLUDED.manufacturer,
    updated_at = CASE WHEN 
                        airboltic_dwh_staging.aeroplane.airplane_model <> EXCLUDED.airplane_model
                        OR airboltic_dwh_staging.aeroplane.manufacturer <> EXCLUDED.manufacturer
                      THEN CURRENT_TIMESTAMP
                      ELSE airboltic_dwh_staging.aeroplane.updated_at
                END;