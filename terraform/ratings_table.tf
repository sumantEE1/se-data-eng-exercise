resource "google_bigquery_table" "ratings_table_mar25_sumant"{
  dataset_id                  = var.dataset
  project                     = "ee-india-se-data"
  table_id                    = "ratings_table_mar25"
  description                 = "This is a ratings table"
  deletion_protection         = false

  labels = {
    env = "default"
    time = "mar25"
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
    },
    {
        "name": "load_date" ,
        "type": "TIMESTAMP",
        "mode": "nullable",
        "defaultValueExpression": "CURRENT_TIMESTAMP()",
        "description": ""
    }
  ]
  EOF
}