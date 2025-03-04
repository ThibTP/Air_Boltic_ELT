-- Truncate all tables in raw schema DWH before load data
TRUNCATE TABLE raw.customer CASCADE;
TRUNCATE TABLE raw.customer_group CASCADE;
TRUNCATE TABLE raw.aeroplane CASCADE;
TRUNCATE TABLE raw.aeroplane_model CASCADE;
TRUNCATE TABLE raw.trip CASCADE;
TRUNCATE TABLE raw.order CASCADE;
