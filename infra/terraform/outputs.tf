output "gsa_private_key_gcr" {
  value       = base64decode(google_service_account_key.gcr.private_key)
  description = "Get private key of the Container Registry service account"
  sensitive   = true
}

output "gsa_private_key_app" {
  value       = base64decode(google_service_account_key.app.private_key)
  description = "Get private key of the App service account"
  sensitive   = true
}
