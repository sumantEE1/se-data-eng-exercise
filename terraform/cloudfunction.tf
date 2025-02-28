resource "google_storage_bucket_object" "cloud_function_mar25_archive" {
  name   = "movie_raw_data_loader_mar25.zip"
  bucket = "${google_storage_bucket.cloudfunction-bucket-mar25-sumant.name}"
  source = "movie_raw_data_loader.zip"

  depends_on = [
    data.archive_file.cloud_function_mar25_archive
  ]
}

data "archive_file" "cloud_function_mar25_archive" {
  type = "zip"
  source_dir = "../movie-raw-data-loader"
  excludes = ["movie-raw-data-loader"]
  output_path = "${path.module}/movie_raw_data_loader.zip"
}

resource "google_cloudfunctions_function" "function_mar25" {
  name        = "newRawMovieFileAddedToBucket"
  description = "Function will be invoked when object is pushed to bucket"
  runtime     = "python311"
  region      = "us-central1"
  project     = "ee-india-se-data"
  labels = {
    env = "default"
    time = "mar25"
  }


  available_memory_mb   = 1024
  source_archive_bucket = "${google_storage_bucket.cloudfunction-bucket-mar25-sumant.name}"
  source_archive_object = "${google_storage_bucket_object.cloud_function_mar25_archive.name}"

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource = "se-data-landing-mar25-sumant"
  }
}