--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.customer (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    customer_group_id INTEGER,
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

ALTER TABLE raw.customer OWNER TO postgres;

--
-- Name: customer_group; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.customer_group (
    customer_group_id INTEGER PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255),
    registry_number BIGINT
);

ALTER TABLE raw.customer_group OWNER TO postgres;

--
-- Name: aeroplane; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.aeroplane (
    airplane_id INTEGER PRIMARY KEY,
    airplane_model VARCHAR(255),
    manufacturer VARCHAR(255)
);

ALTER TABLE raw.aeroplane OWNER TO postgres;

--
-- Name: aeroplane_model; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.aeroplane_model (
    manufacturer VARCHAR(255),
    airplane_model VARCHAR(255),
    max_seats INTEGER,
    max_weight FLOAT,
    max_distance FLOAT,
    engine_type VARCHAR(255)
);

ALTER TABLE raw.aeroplane_model OWNER TO postgres;

--
-- Name: trip; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.trip (
    trip_id INTEGER PRIMARY KEY,
    origin_city VARCHAR(255),
    destination_city VARCHAR(255),
    airplane_id INTEGER,
    start_timestamp TIMESTAMP,
    end_timestamp TIMESTAMP
);

ALTER TABLE raw.trip OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.order (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    trip_id INTEGER,
    price_eur DECIMAL(10,2),
    seat_no VARCHAR(10),
    status VARCHAR(50)
);

ALTER TABLE raw.order OWNER TO postgres;

-- Data for Name: customers; Type: TABLE DATA; Schema: raw; Owner: postgres
--

COPY public.customers (customer_id, name, customer_group_id, email, phone_number) FROM AirBoltic_BE;
1	John Doe	1	john.doe@gmail.com	+1-555-123-4567
2	Jane Smith	\N	jane.smith@yahoo.com	+44 20 7946 0958
3	Alice Johnson	3	alice.j@example.com	+49-30-12345678
4	Bob Brown	4	bob.brown@outlook.com	+61-2-9876-5432
5	Carol White	\N	carol.white@company.com	+1 (555) 567-8901
6	David Wilson	6	david.wilson@domain.co.uk	+33 1 44 55 66 77
7	Emma Davis	7	emma.davis@abc.net	\N
8	Frank Miller	\N	frank.m@anothermail.com	+91-22-1234-5678
9	Grace Taylor	9	grace.taylor@mailservice.org	+81-3-1234-5678
10	Henry Anderson	10	henry.anderson@website.io	+1-555-012-3456
11	Irene Thomas	1	irene.thomas@samplemail.com	+34 91 123 45 67
12	Jack Moore	2	jack.moore@webmail.com	\N
13	Karen Jackson	\N	karen.jackson@provider.net	+61-7-9876-1234
14	Larry Harris	4	larry.harris@domain.net	+27 11 123 4567
15	Megan Martin	5	\N	+1-555-567-9012
16	Nancy Thompson	6	nancy.t@gmail.com	+1 (555) 678-0123
17	Oliver Garcia	\N	oliver.garcia@mail.org	+52 55 1234 5678
18	Patricia Martinez	8	\N	\N
19	Quentin Lee	\N	quentin.lee@example.com	+82-2-123-4567
20	Rachel Walker	10	rachel.walker@company.net	+1 (555) 012-4567
\.

--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);



--------- EXECUTE THE SAME FOR ALL source TABLES ----------- 
