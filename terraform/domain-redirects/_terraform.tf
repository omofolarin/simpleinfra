// Configuration for Terraform itself.

terraform {
  required_version = "~> 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }

  backend "s3" {
    bucket         = "rust-terraform"
    key            = "simpleinfra/domain-redirects.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-1"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
  alias   = "east1"
}
