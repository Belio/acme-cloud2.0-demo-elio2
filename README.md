# acme-infra

Terraform infrastructure for ACME Corp — managed via **Terraform Cloud**.

## Cloud 2.0 Initiative

This repo implements the CIO's Cloud 2.0 provisioning standard:
- **One platform** — Terraform Cloud manages all environments
- **Reusable modules** — published to the private TFC module registry
- **Two clouds** — Microsoft Azure and Google Cloud Platform
- **One workflow** — same CLI, same UI, same RBAC regardless of target cloud

## Repository structure

```
acme-infra/
  modules/
    azure-network/    # Reusable Azure VNet + subnet + NSG module
    gcp-network/      # Reusable GCP VPC + subnetwork + firewall module
  environments/
    prod-azure/       # TFC workspace: acme-prod-azure  (Azure, eastus)
    dev-gcp/          # TFC workspace: acme-dev-gcp     (GCP, us-central1)
  README.md
```

## Terraform Cloud workspaces

| Workspace | Cloud | Region | VCS path |
|---|---|---|---|
| `acme-prod-azure` | Microsoft Azure | eastus | `environments/prod-azure/` |
| `acme-dev-gcp` | Google Cloud | us-central1 | `environments/dev-gcp/` |

## Private module registry

Both modules are published to the Terraform Cloud private registry under the `acme-corp-demo` organization:

```hcl
# Azure network
module "azure_network" {
  source  = "app.terraform.io/acme-corp-demo/azure-network/azurerm"
  version = "1.0.0"
  ...
}

# GCP network
module "gcp_network" {
  source  = "app.terraform.io/acme-corp-demo/gcp-network/google"
  version = "1.0.0"
  ...
}
```

## Credentials

All credentials are stored as sensitive environment variables in **Terraform Cloud Variable Sets** — never in code or `.env` files.

| Variable Set | Scope | Variables |
|---|---|---|
| Azure Credentials | `acme-prod-azure` | `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID` |
| GCP Credentials | `acme-dev-gcp` | `GOOGLE_CREDENTIALS`, `gcp_project_id` |

## Getting started (local dev)

```bash
# Authenticate to Terraform Cloud
terraform login

# Navigate to an environment
cd environments/prod-azure

# Initialize (connects to remote workspace)
terraform init

# Plan remotely — logs stream to your terminal
terraform plan
```

## Terraform version

Requires Terraform >= 1.6.0
