resource "google_bigquery_table" "default" {
    dataset_id = "movies_data_sumant"
    table_id   = "movies_dataset_raw"
    deletion_protection = false

    schema = <<EOF
[
    {
        "name": "adult" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "belongs_to_collection" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "budget" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "genres" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "homepage" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "id" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "imdb_id" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "original_language" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "original_title" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "overview" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "popularity" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "poster_path" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "production_companies" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "production_countries" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "release_date" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "revenue" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "runtime" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "spoken_languages" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "status" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "tagline" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "title" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "video" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "vote_average" ,
        "type": "STRING",
        "mode": "NULLABLE",
        "description": ""
    },
    {
        "name": "vote_count" ,
        "type": "STRING",
        "mode": "NULLABLE",
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