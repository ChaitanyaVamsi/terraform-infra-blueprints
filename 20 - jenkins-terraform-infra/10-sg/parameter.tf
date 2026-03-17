resource "aws_ssm_parameter" "sg_id_to_ssm_param" {
  count = length(var.sg_names)
  name = "/${var.project_name}/${var.environment}/${var.sg_names[count.index]}_sg_id"
  type = "String"
  value = module.sg[count.index].sg_id  # this sg_id is coming from module outputs.tf
  # This output exposes the Security Group ID created inside the module.
# - aws_security_group.main.id is the actual SG created by this module.
# - output "sg_id" allows the root module (or other modules) to access this SG ID.
#   For example, the root module can store it in SSM Parameter Store or use it in other resources.
  overwrite = true
}