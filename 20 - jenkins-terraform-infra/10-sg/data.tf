data "aws_ssm_parameter" "get_vpc_id_from_ssm" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}