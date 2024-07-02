resource "google_storage_bucket" "storage" {
 name          = "se-data-landing-sumant"
 location      = "US-CENTRAL1"
 storage_class = "STANDARD"
 force_destroy = true

 public_access_prevention = "enforced"
 uniform_bucket_level_access = true
}