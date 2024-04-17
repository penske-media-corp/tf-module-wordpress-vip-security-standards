terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }
  provider "github" {
  owner = "penske-media-corp"
  app_auth {
    id              = var.github_app_id
    installation_id = var.github_app_installation_id
    pem_file        = var.github_app_pem_file
  }
}
}
