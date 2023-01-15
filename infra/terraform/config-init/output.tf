output "bucket_tfstate" {
  value       = google_storage_bucket.tfstate.name
  description = "Bucket to store Terraform state"
}

output "gsa_private_key_terraform" {
  value       = base64decode(google_service_account_key.terraform.private_key)
  description = "Export terraform service account private key"
  sensitive   = true
}
