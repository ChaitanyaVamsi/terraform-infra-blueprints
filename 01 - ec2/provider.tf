terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# -----------------------------
# Concept Explanation:
# In Terraform, a "provider" is a plugin that allows Terraform
# to interact with a specific cloud platform or service (like AWS, Azure, or GCP).
# It defines how Terraform should connect, authenticate, and manage resources
# on that platform.

# In this example:
# - The AWS provider is being used.
# - Terraform will deploy resources in the "us-east-1" region.

# This is a core concept in Terraform and every project needs at least one provider.
# Understanding providers is essential for beginners and anyone learning
# Infrastructure as Code with Terraform.
# -----------------------------