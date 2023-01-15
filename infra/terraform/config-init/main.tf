terraform {
  required_providers {
    google = {
      version = "4.48.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Create GCP project automatically if variable is true
resource "google_project" "challenge" {
  count               = var.project_creation_enabled ? 1 : 0
  name                = var.project_name
  project_id          = var.project_id
  billing_account     = var.billing_account_id
  auto_create_network = false
}

# Enable required service APIs
resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_services)
  project  = var.project_id
  service  = each.key
}

# Bucket to store Terraform state
resource "google_storage_bucket" "tfstate" {
  force_destroy = var.bucket_force_destroy
  name          = "${var.project_prefix}-tfstate"
  project       = var.project_id
  location      = var.bucket_location
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

# Create terraform service account for Github Actions to create infrastructure via workflow
resource "google_service_account" "terraform" {
  project      = var.project_id
  account_id   = "sa-${var.project_prefix}-tf"
  display_name = "Terraform - Service Account"
  description  = "Terraform service account for ${var.project_id}"
}

# Grant required roles to terraform service account to manage resources
resource "google_project_iam_member" "terraform" {
  for_each = toset(var.tf_roles)
  project  = var.project_id
  role     = each.key
  member   = "serviceAccount:${google_service_account.terraform.email}"
}

# Generate private key for terraform service account
resource "google_service_account_key" "terraform" {
  service_account_id = google_service_account.terraform.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}
