-- Data Warehouse Staging Schema


-- Create the schema if not exist yet
CREATE SCHEMA IF NOT EXISTS airboltic_dwh_staging AUTHORIZATION postgres;

-- STAGING TABLES

-- CREATE TABLE AND ITS CONSTRAINTS FOR THE STAGING SCHEMA

CREATE TABLE airboltic_dwh_staging.customer (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    customer_group_id INTEGER,
    email VARCHAR(255),
    phone_number VARCHAR(20)
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);

CREATE TABLE airboltic_dwh_staging.customer_group (
    customer_group_id INTEGER PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255),
    registry_number BIGINT
    CONSTRAINT customer_group_pkey PRIMARY KEY (customer_group_id)
);

CREATE TABLE airboltic_dwh_staging.aeroplane (
    airplane_id INTEGER PRIMARY KEY,
    airplane_model VARCHAR(255),
    manufacturer VARCHAR(255)
    CONSTRAINT aeroplane_pkey PRIMARY KEY (airplane_id)
);

CREATE TABLE airboltic_dwh_staging.aeroplane_model (
    manufacturer VARCHAR(255),
    airplane_model VARCHAR(255),
    max_seats INTEGER,
    max_weight FLOAT,
    max_distance FLOAT,
    engine_type VARCHAR(255)
    CONSTRAINT aeroplane_model_pkey PRIMARY KEY (airplane_model)
);


CREATE TABLE airboltic_dwh_staging.trip (
    trip_id INTEGER PRIMARY KEY,
    origin_city VARCHAR(255),
    destination_city VARCHAR(255),
    airplane_id INTEGER,
    start_timestamp TIMESTAMP,
    end_timestamp TIMESTAMP
    CONSTRAINT trip_pkey PRIMARY KEY (trip_id)
);

CREATE TABLE airboltic_dwh_staging.order (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    trip_id INTEGER,
    price_eur DECIMAL(10,2),
    seat_no VARCHAR(10),
    status VARCHAR(50)
    CONSTRAINT order_pkey PRIMARY KEY (order_id)
);