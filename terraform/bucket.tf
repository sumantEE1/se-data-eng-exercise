resource "google_storage_bucket" "storage" {
 name          = var.data_bucket
 location      = "US-CENTRAL1"
 project       = "ee-india-se-data"
 storage_class = "STANDARD"
 force_destroy = true

 public_access_prevention = "enforced"
 uniform_bucket_level_access = true
 labels = {
    env = "default"
    time = "mar25"
  }
}

resource "google_storage_bucket" "cloudfunction-bucket-mar25-sumant" {
  name = var.archive_bucket
  location      = "US-CENTRAL1"
  project        = "ee-india-se-data"
  storage_class = "STANDARD"
  force_destroy = true

  public_access_prevention = "enforced"
  labels = {
    env = "default"
    time = "mar25"
  }
}