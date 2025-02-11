resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "movie_data_feb25_sumant"
  friendly_name               = "movie_dataset_sumant"
  project                     = "ee-india-se-data"
  description                 = "Data set for movie"
  location                    = "US-CENTRAL1"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
    time = "feb25"
  }

}
