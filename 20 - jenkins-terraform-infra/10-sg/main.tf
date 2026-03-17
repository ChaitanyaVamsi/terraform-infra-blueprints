module "sg" {
  count = lenght(var.sg_names)
  source = "git::https://github.com/daws-86s/terraform-aws-sg.git?ref=main"
  project_name = var.project_name // in modules check variables
  environtment = var.environment
  sg_name = var.sg_names[count.index]
  sg_description = "Created for ${var.sg_names[count.index]}"
  vpc_id = local.vpc_id
}