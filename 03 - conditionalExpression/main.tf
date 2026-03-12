resource "aws_instance" "web_server" {
  ami = "ami-0fd3ac4abb734302a"
  instance_type = var.env == "dev" ? "t3.micro" : "t3.small"

  tags = {
    Name = "web-server"
    env = var.env
  }
}

# ------------------------------------------------------------
# Notes for Developers
#
# This Terraform configuration creates an EC2 instance.
#
# The instance type is selected based on the environment (env):
#
# env = "dev"  -> instance_type = t3.micro
# env = "qa"   -> instance_type = t3.small
# env = "prod" -> instance_type = t3.small
#
# Default environment is "qa" unless overridden.
#
# Ways to override the env variable:
#
# 1. CLI
# terraform apply -var="env=dev"
#
# 2. terraform.tfvars
# env = "dev"
#
# 3. Environment variable
# export TF_VAR_env=dev
#
# Security Groups:
# vpc_security_group_ids is not specified, so the instance
# will attach to the default VPC security group automatically.
#
# Tags:
# The EC2 instance will be tagged with the environment name.
# ------------------------------------------------------------