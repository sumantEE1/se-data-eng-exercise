resource "google_bigquery_table" "ratings_table_feb25_sumant"{
  dataset_id                = "movie_data_feb25_sumant"
  table_id                    = "ratings_table_feb25"
  description                 = "This is a ratings table"
  deletion_protection         = false

  labels = {
    env = "default"
    time = "feb25"
  }
  schema = <<EOF
  [
    {
      "name": "userId",
      "type": "STRING",
      "mode": "nullable",
      "description": ""
    },
    {
      "name": "movieId",
      "type": "STRING",
      "mode": "nullable",
      "description": ""
    },
    {
      "name": "rating",
      "type": "STRING",
      "mode": "nullable",
      "description": ""
    },
    {
      "name": "timestamp",
      "type": "STRING",
      "mode": "nullable",
      "description": ""      
    }
  ]
  EOF
}