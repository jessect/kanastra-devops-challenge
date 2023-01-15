# Grant permission to pull images from container registry
resource "google_project_iam_member" "gcr" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gcr.email}"
}

# Grant required permissions to run the application pipeline
resource "google_project_iam_member" "app" {
  for_each = toset(var.app_roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.app.email}"
}
