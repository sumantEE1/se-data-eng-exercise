pip install dbt dbt-biqquery
dbt init
- <name of project>
- <name of adapter for database - selected bigquery>
- <authentication option - selected service account <Set the path of you service account key>>
- <GCP project-id - ee-india-se-data>
- <name of dbt dataset - movie_data_mar25_sumant>
- <threads - selected 1>
- <job_execution_timeout_seconds[300] - 5>
- <desired location option - selected US>