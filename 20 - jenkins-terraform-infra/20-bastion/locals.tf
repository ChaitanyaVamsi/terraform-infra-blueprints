# Get the first public subnet ID from SSM Parameter Store.
# - data.aws_ssm_parameter.public_subnet_ids.value returns a comma-separated string of all public subnet IDs.
# - split(",", ...) converts it to a list.
# - [0] selects the first subnet from the list to launch the EC2 instance in.