

instance_type = "t3.small"

// this has precedence over the variable.tf

# --------------------------------------------------------
# Terraform Variable Precedence (Which value Terraform uses)
#
# 1️⃣ CLI Flag (-var="...")
#    - Highest priority
#    - Example:
#      terraform apply -var="web_server_instance_type=t3.large"
#    - Overrides everything else
#
# 2️⃣ terraform.tfvars or *.auto.tfvars
#    - Second priority
#    - Example in terraform.tfvars:
#      web_server_instance_type = "t3.small"
#
# 3️⃣ Environment Variable
#    - Example:
#      export TF_VAR_web_server_instance_type=t3.medium
#    - Used if no CLI or tfvars value is provided
#
# 4️⃣ Default value in variables.tf
#    - Lowest priority
#    - Example:
#      default = "t3.micro"
#    - Used only if no other value is provided
#
# ⚡ Summary Example:
# - variables.tf default: t3.micro
# - terraform.tfvars: t3.small
# - CLI flag: t3.large
# Result: Terraform uses t3.large if CLI flag is provided
# --------------------------------------------------------


# | Source                         | Value used               |
# | ------------------------------ | ------------------------ |
# | CLI `-var`                     | `t3.large` (if provided) |
# | `terraform.tfvars`             | `t3.small`               |
# | Environment Variable `TF_VAR_` | `t3.medium` (if set)     |
# | Default in `variables.tf`      | `t3.micro`               |


# Example Scenarios:

# 1 -  Only variables.tf exists → Terraform uses "t3.micro".

# 2 - terraform.tfvars exists → Terraform uses "t3.small".

# 3 - CLI -var is passed → Terraform uses that value ("t3.large"), ignoring terraform.tfvars and default.

# file name can be anything dev.tfvars , prod.tfvars