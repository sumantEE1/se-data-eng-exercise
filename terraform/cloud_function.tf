resource "google_storage_bucket" "function-bucket" {
  name = "se-data-cloudfunction-bucket-sumant"
  location      = "US-CENTRAL1"
  storage_class = "STANDARD"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket_object" "movie_raw_data_loader_cloud_function_archive" {
  name   = "movie_raw_data_loader.zip"
  bucket = "${google_storage_bucket.function-bucket.name}"
  source = "movie_raw_data_loader.zip"

  depends_on = [
    data.archive_file.movie_raw_data_loader_cloud_function_archive
  ]
}

data "archive_file" "movie_raw_data_loader_cloud_function_archive" {
    type = "zip"
    source_dir = "../movie-raw-data-loader"
    excludes = ["movie-raw-data-loader"]
    output_path = "${path.module}/movie_raw_data_loader.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "newFileInBucket"
  description = "Function will be fired when new object is pushed/created in bucket"
  runtime     = "python311"
  region = "us-central1"

  available_memory_mb   = 1024
  source_archive_bucket = "${google_storage_bucket.function-bucket.name}"
  source_archive_object = "${google_storage_bucket_object.movie_raw_data_loader_cloud_function_archive.name}"

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource = "se-data-landing-sumant"
  }
}