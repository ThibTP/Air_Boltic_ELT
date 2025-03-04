--
--- Query for load data and handling new data (upsert) from db sources into staging schema in DWH
--

INSERT INTO airboltic_dwh_staging.order
    (order_id, customer_id, trip_id, price_eur, seat_no, status)

SELECT
    order_id,
    customer_id,
    trip_id,
    price_eur,
    seat_no,
    status
FROM raw.order

ON CONFLICT (order_id)
DO UPDATE SET
    customer_id = EXCLUDED.customer_id,
    trip_id = EXCLUDED.trip_id,
    price_eur = EXCLUDED.price_eur,
    seat_no = EXCLUDED.seat_no,
    status = EXCLUDED.status,
    updated_at = CASE WHEN 
                        airboltic_dwh_staging.order.customer_id <> EXCLUDED.customer_id
                        OR airboltic_dwh_staging.order.trip_id <> EXCLUDED.trip_id
                        OR airboltic_dwh_staging.order.price_eur <> EXCLUDED.price_eur
                        OR airboltic_dwh_staging.order.seat_no <> EXCLUDED.seat_no
                        OR airboltic_dwh_staging.order.status <> EXCLUDED.status
                      THEN CURRENT_TIMESTAMP
                      ELSE airboltic_dwh_staging.order.updated_at
                END;