# Terraform block is used to configure Terraform behavior
# like required providers and backend (where the state file is stored)
terraform {

  # Define required providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"   # Official AWS provider
      version = "6.16.0"          # Provider version to use
    }
  }

  # Backend configuration tells Terraform
  # where the state file should be stored
  backend "s3" {

    # S3 bucket used to store Terraform remote state
    bucket = "teraform-state-repo"

    # Path/name of the state file inside the bucket
    # Different keys can be used for different environments
    # Example: dev/terraform.tfstate, prod/terraform.tfstate
    key = "samplestateFile"

    # Region where the S3 bucket is located
    region = "us-east-1"

    # Enables state locking to prevent multiple users
    # from modifying infrastructure at the same time
    use_lockfile = true

    # Encrypts the state file stored in S3 for security
    encrypt = true
  }
}

# AWS provider configuration
provider "aws" {

  # Region where AWS resources will be created
  # This is independent from the S3 backend region
  region = "ap-south-1"
}


# This Terraform configuration uses an S3 remote backend to store the state file.
# Remote state allows multiple team members to work on the same infrastructure
# safely by storing the state file in a shared S3 bucket instead of locally.
#
# Advantages:
# - Shared state for team collaboration
# - State locking to prevent concurrent changes
# - Encrypted and secure storage of infrastructure state