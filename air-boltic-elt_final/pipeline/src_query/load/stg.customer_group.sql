--
--- Query for load data and handling new data (upsert) from db sources into staging schema in DWH
--

INSERT INTO airboltic_dwh_staging.customer_group
    (customer_group_id, type, name, registry_number)

SELECT
    customer_group_id,
    type,
    name,
    registry_number
FROM raw.customer_group

ON CONFLICT(customer_group_id)
DO UPDATE SET
    type = EXCLUDED.type,
    name = EXCLUDED.name,
    registry_number = EXCLUDED.registry_number,
    updated_at = CASE WHEN 
                        OR airboltic_dwh_staging.customer_group.type <> EXCLUDED.type
                        OR airboltic_dwh_staging.customer_group.name <> EXCLUDED.name
                        OR airboltic_dwh_staging.customer_group.registry_number <> EXCLUDED.registry_number
                THEN
                        CURRENT_TIMESTAMP
                ELSE
                        airboltic_dwh_staging.customer_group.updated_at
                END;

