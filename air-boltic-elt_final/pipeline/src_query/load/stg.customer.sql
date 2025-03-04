--
--- Query for load data and handling new data (upsert) from db sources into staging schema in DWH
--


INSERT INTO airboltic_dwh_staging.customer
    (customer_id, name, customer_group_id, email, phone_number)

SELECT
    customer_id,
    name,
    customer_group_id,
    email,
    phone_number
FROM raw.customer

ON CONFLICT (customer_id)
DO UPDATE SET
    name = EXCLUDED.name,
    customer_group_id = EXCLUDED.customer_group_id,
    email = EXCLUDED.email,
    phone_number = EXCLUDED.phone_number,
    updated_at = CASE WHEN 
                        airboltic_dwh_staging.customer.name <> EXCLUDED.name
                        OR airboltic_dwh_staging.customer.customer_group_id <> EXCLUDED.customer_group_id
                        OR airboltic_dwh_staging.customer.email <> EXCLUDED.email
                        OR airboltic_dwh_staging.customer.phone_number <> EXCLUDED.phone_number
                      THEN CURRENT_TIMESTAMP
                      ELSE airboltic_dwh_staging.customer.updated_at
                END;