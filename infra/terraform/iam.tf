# Grant permission to pull images from container registry
resource "google_project_iam_member" "gcr" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gcr.email}"
}

# Grant required permissions to run the application pipeline

resource "google_project_iam_custom_role" "app" {
  role_id     = "kanastra.app"
  title       = "Kanastra App Role"
  description = "Grant required access to the application pipeline"
  permissions = [
    "resourcemanager.projects.get",
    "resourcemanager.projects.list",
    "storage.buckets.get",
    "storage.buckets.get",
    "storage.multipartUploads.abort",
    "storage.multipartUploads.create",
    "storage.multipartUploads.list",
    "storage.multipartUploads.listParts",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.list",
    "storage.objects.list"
  ]
}
resource "google_project_iam_member" "app" {
  for_each = toset(var.app_roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.app.email}"
}
