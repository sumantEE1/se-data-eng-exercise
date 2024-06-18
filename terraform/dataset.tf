resource "google_bigquery_dataset" "dataset"{
    dataset_id    =  "movies_data_sumant"
    location      =  "ASIA-SOUTH2"
    friendly_name =  "se_data_eng_exer_sumant"
}