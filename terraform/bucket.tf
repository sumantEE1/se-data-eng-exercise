resource "google_storage_bucket" "storage" {
 name          = "se-data-landing-feb25-sumant"
 location      = "US-CENTRAL1"
 project       = "ee-india-se-data"
 storage_class = "STANDARD"
 force_destroy = true

 public_access_prevention = "enforced"
 uniform_bucket_level_access = true
 labels = {
    env = "default"
    time = "feb25"
  }
}