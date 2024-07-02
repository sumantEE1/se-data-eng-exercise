resource "google_storage_bucket" "function-bucket" {
  name = "se-data-cloudfunction-bucket-sumant"
  location      = "US-CENTRAL1"
  storage_class = "STANDARD"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket_object" "archive" {
  name   = "main.zip"
  bucket = "${google_storage_bucket.function-bucket.name}"
  source = "main.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "main"
  description = "Function will be fired when new object is pushed/created in bucket"
  runtime     = "python37"
  region = "us-central1"

  available_memory_mb   = 128
  source_archive_bucket = "${google_storage_bucket.function-bucket.name}"
  source_archive_object = "${google_storage_bucket_object.archive.name}"
  entry_point           = "newFileInBucket"

  event_trigger {
    event_type = "google.storage.object.finalize"
    resource = "se-data-landing-sumant"
  }
}