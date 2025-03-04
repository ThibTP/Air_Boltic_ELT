SELECT 
    DATE_TRUNC('day', generated_date) AS date_actual,
    TO_CHAR(generated_date, 'DDth') AS day_suffix,
    TO_CHAR(generated_date, 'Day') AS day_name,
    EXTRACT(DOY FROM generated_date) AS day_of_year,
    (EXTRACT(DAY FROM generated_date) - 1) / 7 + 1 AS week_of_month,
    EXTRACT(WEEK FROM generated_date) AS week_of_year,
    EXTRACT(MONTH FROM generated_date) AS month_actual,
    TO_CHAR(generated_date, 'Month') AS month_name,
    TO_CHAR(generated_date, 'MMYYYY') AS mmyyyy,
    TO_CHAR(generated_date, 'MMDDYYYY') AS mmddyyyy
FROM (
    SELECT generate_series('2020-01-01'::DATE, '2030-12-31'::DATE, '1 day') AS generated_date
) d
