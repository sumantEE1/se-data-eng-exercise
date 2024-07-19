import functions_framework
from google.cloud import bigquery

client = bigquery.Client()
print("came")

# Register a CloudEvent function with the Functions Framework
@functions_framework.cloud_event
def newFileInBucket(cloud_event):
  print("came here")
  print("event data",cloud_event )
  data = cloud_event.data
  uri = data.selfLink
  file_name = data.name
  print("event data", uri, file_name)
  table_id = "ee-india-se-data.movies_data_sumant.movies_dataset_raw"

  job_config = bigquery.LoadJobConfig(
      schema=[
          bigquery.SchemaField("name", "STRING"),
          bigquery.SchemaField("adult","STRING"),
          bigquery.SchemaField("belongs_to_collection" ,"STRING"),
          bigquery.SchemaField("budget" ,"STRING"),
          bigquery.SchemaField("genres" ,"STRING"),
          bigquery.SchemaField("homepage" ,"STRING"),
          bigquery.SchemaField("id" ,"STRING"),
          bigquery.SchemaField("imdb_id" ,"STRING"),
          bigquery.SchemaField("original_language" ,"STRING"),
          bigquery.SchemaField("original_title" ,"STRING"),
          bigquery.SchemaField("overview" ,"STRING"),
          bigquery.SchemaField("popularity" ,"STRING"),
          bigquery.SchemaField("poster_path" ,"STRING"),
          bigquery.SchemaField("production_companies" ,"STRING"),
          bigquery.SchemaField("production_countries" ,"STRING"),
          bigquery.SchemaField("release_date" ,"STRING"),
          bigquery.SchemaField("revenue" ,"STRING"),
          bigquery.SchemaField("runtime" ,"STRING"),
          bigquery.SchemaField("spoken_languages" ,"STRING"),
          bigquery.SchemaField("status" ,"STRING"),
          bigquery.SchemaField("tagline" ,"STRING"),
          bigquery.SchemaField("title" ,"STRING"),
          bigquery.SchemaField("video" ,"STRING"),
          bigquery.SchemaField("vote_average" ,"STRING"),
          bigquery.SchemaField("vote_count" ,"STRING"),
          bigquery.SchemaField("load_date" ,"TIMESTAMP"),
      ],
      skip_leading_rows=1,
      # The source format defaults to CSV, so the line below is optional.
      source_format=bigquery.SourceFormat.CSV,
  )
  print("event data", uri, file_name)

  # load_job = client.load_table_from_uri(
  #     uri, table_id, job_config=job_config
  # )  # Make an API request.

  # load_job.result()  # Waits for the job to complete.

  # destination_table = client.get_table(table_id)  # Make an API request.
  # print("Loaded {} rows.".format(destination_table.num_rows))
  # print("Sumant-cloudfunction: Hello there")
  
  # print("Sumant-cloudfunction: new file %s", data)
  return data