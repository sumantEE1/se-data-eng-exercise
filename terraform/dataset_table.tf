resource "google_bigquery_table" "movie_data_raw_table_feb25_sumant" {
  dataset_id                  = "movie_data_feb25_sumant"
  table_id                    = "movie_data_raw_table_feb25"
  description                 = "This is a raw movie table"
  deletion_protection         = false

  labels = {
    env = "default"
    time = "feb25"
  }
  schema = <<EOF
  [
    {
        "name": "adult",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "belongs_to_collection",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "budget",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "genres",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "homepage",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "id",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "imdb_id",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "original_language",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "original_title",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "overview",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "popularity",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "poster_path",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "production_companies",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "production_countries",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "release_date",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "revenue",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "runtime",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "spoken_languages",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "status",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "tagline",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "title",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "video",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "vote_average",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "vote_count",
        "type": "STRING",
        "mode": "nullable",
        "description": ""
    },
    {
        "name": "load_date" ,
        "type": "TIMESTAMP",
        "mode": "NULLABLE",
        "defaultValueExpression": "CURRENT_TIMESTAMP()",
        "description": ""
    }
  ]
  EOF

}
