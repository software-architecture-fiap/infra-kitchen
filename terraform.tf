terraform {
  cloud {
    organization = "tc_fiap"

    workspaces {
      name = "infra-kitchen"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70.0"
    }
  }
}
