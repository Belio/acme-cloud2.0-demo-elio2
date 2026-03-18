# environments/dev-gcp/outputs.tf

output "network_id" {
  description = "GCP VPC network ID"
  value       = module.gcp_network.network_id
}

output "network_name" {
  description = "GCP VPC network name"
  value       = module.gcp_network.network_name
}

output "subnet_id" {
  description = "GCP subnetwork ID"
  value       = module.gcp_network.subnet_id
}

output "gcs_bucket_name" {
  description = "GCS orders bucket name"
  value       = google_storage_bucket.orders.name
}

output "gcs_bucket_url" {
  description = "GCS bucket self-link URL"
  value       = google_storage_bucket.orders.self_link
}
