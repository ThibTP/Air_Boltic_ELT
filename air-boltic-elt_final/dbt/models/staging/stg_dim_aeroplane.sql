SELECT 
    a.airplane_id, 
    a.airplane_model AS airplane_model_id, 
    a.manufacturer, 
    am.engine_type,
    CURRENT_DATE AS created_at,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source("airboltic-dwh", "aeroplane") }} a
LEFT JOIN {{ source("airboltic-dwh", "aeroplane_model") }} am
    ON a.airplane_model = am.airplane_model
