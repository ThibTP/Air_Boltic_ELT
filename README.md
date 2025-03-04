## Project Structure

I will not code the entire project (e.g., Airflow DAGs, DBT models), but I will cover how the project structure should look with the relevant folders alongside the implementation of the data model.

- `project/`
  - `schema/` → *Store SQL scripts for schema setup*
    - `dwh_schema/` → *Data Warehouse Staging Schema*
    - `src_schema/` → *Source Tables Schema*
  - `dbt/` → *Store DBT models and transformations*
    - `mart/` → *Mart layer where metrics/KPIs are computed*
    - `staging/` → *Staging layer (dimensions & fact tables)*
  - `logs/` → *Store pipeline logs*
  - `pipeline/` → *Store pipeline dependencies and scripts*
    - `src_query/` → *All SQL queries used in ELT*
    - `elt_dev_script.py`
  - `.env`
  - `main_pipeline.py` → *Main entry point for ELT pipeline*
  - `etl_pipeline.sh` → *Shell script to automate pipeline execution*
  - `docker-compose.yml` → *Containerized execution setup*
  - `requirements.txt` → *Dependencies for the project*
