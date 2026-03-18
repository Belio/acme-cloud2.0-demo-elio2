# modules/gcp-network/outputs.tf

output "network_id" {
  description = "The ID of the GCP VPC network"
  value       = google_compute_network.main.id
}

output "network_name" {
  description = "The name of the GCP VPC network"
  value       = google_compute_network.main.name
}

output "subnet_id" {
  description = "The ID of the subnetwork"
  value       = google_compute_subnetwork.main.id
}

output "subnet_name" {
  description = "The name of the subnetwork"
  value       = google_compute_subnetwork.main.name
}
