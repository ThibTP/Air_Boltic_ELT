SELECT 
    customer_group_id, 
    type, 
    name, 
    registry_number,
    CURRENT_TIMESTAMP AS created_at,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source("airboltic-dwh", "customer_group") }} 
