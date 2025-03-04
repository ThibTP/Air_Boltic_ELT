SELECT 
    customer_id, 
    customer_group_id, 
    name, 
    email, 
    phone_number, 
    CURRENT_TIMESTAMP AS created_at,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source("airboltic-dwh", "customer") }} 
