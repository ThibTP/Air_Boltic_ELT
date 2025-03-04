SELECT 
    EXTRACT(EPOCH FROM generated_date)::INTEGER / 86400 AS date_id,
    DATE_TRUNC('day', generated_date) AS date_actual,
    CASE 
        WHEN EXTRACT(DAY FROM generated_date) IN (11,12,13) THEN TO_CHAR(generated_date, 'DD') || 'th'
        WHEN EXTRACT(DAY FROM generated_date) % 10 = 1 THEN TO_CHAR(generated_date, 'DD') || 'st'
        WHEN EXTRACT(DAY FROM generated_date) % 10 = 2 THEN TO_CHAR(generated_date, 'DD') || 'nd'
        WHEN EXTRACT(DAY FROM generated_date) % 10 = 3 THEN TO_CHAR(generated_date, 'DD') || 'rd'
        ELSE TO_CHAR(generated_date, 'DD') || 'th'
    END AS day_suffix,
    TRIM(TO_CHAR(generated_date, 'Day')) AS day_name,
    EXTRACT(DOY FROM generated_date) AS day_of_year,
    FLOOR((EXTRACT(DAY FROM generated_date) - 1) / 7) + 1 AS week_of_month,
    EXTRACT(WEEK FROM generated_date) AS week_of_year,
    EXTRACT(MONTH FROM generated_date) AS month_actual,
    TRIM(TO_CHAR(generated_date, 'Month')) AS month_name,
    TO_CHAR(generated_date, 'MMYYYY') AS mmyyyy,
    TO_CHAR(generated_date, 'MMDDYYYY') AS mmddyyyy

FROM (
    SELECT generate_series('2020-01-01'::DATE, '2030-12-31'::DATE, '1 day') AS generated_date
) d;
