locals {
  instance_type = var.instance
  common_name = "${var.project}-${var.env}"
  ami_id = data.aws_ami.ami_name.id
  server_tags = merge(var.ec2_tags,
  { Name = "${local.common_name}"})
}