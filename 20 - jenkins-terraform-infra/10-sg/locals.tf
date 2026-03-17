locals {
  common_name_suffix = "${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.get_vpc_id_from_ssm
}