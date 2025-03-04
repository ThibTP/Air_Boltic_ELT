SELECT 
    o.order_id, 
    o.trip_id, 
    a.airplane_id,
    o.customer_id, 
    cg.customer_group_id,
    d.date_id as order_date_id,
    o.status AS order_status, 
    o.price_eur AS order_price, 
    o.seat_no AS seat_number, 
    am.max_seats AS aeroplane_max_seats, 
    am.max_weight AS aeroplane_max_weight, 
    am.max_distance AS aeroplane_max_distance,
    CURRENT_DATE AS created_at,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source("airboltic-dwh", "order") }} o
LEFT JOIN {{ source("airboltic-dwh", "trip") }} t
    ON o.trip_id = t.trip_id
LEFT JOIN {{ source("airboltic-dwh", "customer") }} c
    ON o.customer_id = c.customer_id
LEFT JOIN {{ source("airboltic-dwh", "customer_group") }} cg
    ON c.customer_group_id = cg.customer_group_id
LEFT JOIN {{ source("airboltic-dwh", "aeroplane") }} a
    ON t.airplane_id = a.airplane_id
LEFT JOIN {{ source("airboltic-dwh", "aeroplane_model") }} am
    ON a.airplane_model = am.airplane_model
LEFT JOIN {{ ref('stg_dim_date') }} d
    ON o.order_date = d.date_actual
