resource "aws_instance" "web_server" {
  ami = "ami-0cf8ec67f4b13b491"
  instance_type = var.instance_type
  tags = merge( local.common_tags,{
    Name = "${local.common_name}-tfvars-multiEnv"
  })

}