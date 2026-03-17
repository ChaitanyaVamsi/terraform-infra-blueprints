
locals {
  ami_id = data.aws_ami.joindevops.id
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  common_tags = {
    Project = var.project_name
    Environment = var.environment
    Terraform = true
  }
  pubic_subnet_id = split("," , data.aws_ssm_parameter.public_subnet_ids.value)[0]
  # Get the first public subnet ID from SSM Parameter Store.
# - data.aws_ssm_parameter.public_subnet_ids.value returns a comma-separated string of all public subnet IDs.
# - split(",", ...) converts it to a list.
# - [0] selects the first subnet from the list to launch the EC2 instance in.

}