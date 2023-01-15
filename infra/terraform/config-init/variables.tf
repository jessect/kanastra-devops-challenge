variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "jaylabs-sandbox"
}

variable "project_name" {
  type        = string
  description = "GCP project name"
  default     = "JayLabs - Sandbox"
}

variable "project_prefix" {
  type        = string
  description = "Short name of the project"
  default     = "jaylabs"
}

variable "project_creation_enabled" {
  type        = bool
  description = "Enable GCP project creation"
  default     = false
}

variable "billing_account_id" {
  type        = string
  description = "Billing ID for the project"
  default     = "0X0X0X-0X0X0X-0X0X0X"
}

variable "region" {
  type        = string
  description = "Set region"
  default     = "us-west1"
}

variable "bucket_location" {
  type        = string
  description = "Bucket storage location"
  default     = "US"
}

variable "bucket_name" {
  type        = string
  description = "Bucket name to store Terraform state"
  default     = "jaylabs-tfstate"
}

variable "bucket_force_destroy" {
  type        = bool
  description = "Set flag on force destroy bucket"
  default     = true
}

variable "tf_roles" {
  type        = list(string)
  description = "List of required roles for Terraform service account"
  default = [
    "roles/compute.networkAdmin",
    "roles/storage.objectCreator",
    "roles/container.admin"
  ]
}

variable "gcp_services" {
  type        = list(string)
  description = "List of required service APIs for the project"
  default = [
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "container.googleapis.com",
    "gkehub.googleapis.com",
    "gkeconnect.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "compute.googleapis.com",
    "storage.googleapis.com",
    "servicenetworking.googleapis.com",
    "iam.googleapis.com",
  ]
}
