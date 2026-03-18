# gcp-network module

Reusable GCP VPC network module for ACME Corp.
Published to TFC private registry as `acme-corp-demo/gcp-network/google`.

## Resources created

- `google_compute_network` — custom-mode VPC (no auto subnets)
- `google_compute_subnetwork` — subnetwork with Private Google Access enabled
- `google_compute_firewall` — deny-all-ingress default rule (priority 65534)

## Usage

```hcl
module "gcp_network" {
  source  = "app.terraform.io/acme-corp-demo/gcp-network/google"
  version = "1.0.0"

  environment = "dev"
  region      = "us-central1"
  subnet_cidr = "10.2.0.0/24"
}
```

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name_prefix` | Prefix for all resource names | string | `"acme"` |
| `environment` | Environment name | string | required |
| `region` | GCP region | string | `"us-central1"` |
| `subnet_cidr` | Subnet CIDR range | string | `"10.2.0.0/24"` |

## Outputs

| Name | Description |
|---|---|
| `network_id` | The ID of the GCP VPC network |
| `network_name` | The name of the GCP VPC network |
| `subnet_id` | The ID of the subnetwork |
| `subnet_name` | The name of the subnetwork |
