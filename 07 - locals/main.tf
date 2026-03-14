resource "aws_instance" "web_server" {
  ami = local.ami_id
  instance_type = local.instance_type
  tags = local.server_tags
}