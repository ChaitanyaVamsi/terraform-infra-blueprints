variable "env" {
  type    = string
  default = "qa"

  validation {
    # Checks if the provided env value exists in the allowed list
    condition     = contains(["dev","qa","prod"], var.env)

    # Error message shown if validation fails
    error_message = "env must be dev, qa, or prod."
  }
}

# Environment variable used to determine which environment
# the infrastructure is being deployed to (dev, qa, or prod).
#
# Type: string
# Default: qa
#
# Validation ensures only allowed environments are used.
# This prevents accidental deployments with incorrect
# environment names like "stage" or "development".
#
# Allowed values:
# - dev  : Development environment
# - qa   : Quality Assurance / Testing environment
# - prod : Production environment

# 💡 DevOps interview tip:
#  Variable validation blocks are considered a Terraform best practice because,
#  they prevent configuration mistakes before infrastructure is created in Amazon Web Services.