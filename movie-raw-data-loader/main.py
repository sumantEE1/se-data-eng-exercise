from google.cloud import bigquery

client = bigquery.Client()

def newRawMovieFileAddedToBucket(data,context):
  table_id = "ee-india-se-data.movie_data_feb25_sumant.movie_data_raw_table_feb25"
  print("file-name*** {}".format(data["name"]))
  print("bucket***{}".format(data["bucket"]))

  job_config = bigquery.LoadJobConfig(
    schema=[
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
        bigquery.SchemaField("vote_count" ,"STRING")
        # bigquery.SchemaField("load_date" ,"TIMESTAMP"),
    ],
    skip_leading_rows=1,
    # The source format defaults to CSV, so the line below is optional.
    source_format=bigquery.SourceFormat.CSV,
  )
  bucket = data["bucket"]
  name = data["name"]
  uri = f"gs://{bucket}/{name}"
  print("uri {}".format(uri))
  print("job config".format(job_config))
  
  destination_table = client.get_table(table_id)
  print("Before Load {} rows".format(destination_table.num_rows))

  load_job = client.load_table_from_uri(
      uri, table_id, job_config=job_config
  )  # Make an API request.

  load_job.result()  # Waits for the job to complete.
  destination_table = client.get_table(table_id)
  print("Loaded {} rows".format(destination_table.num_rows))