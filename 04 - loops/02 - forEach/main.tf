resource "aws_instance" "web_server" {
  for_each =  var.instance
  ami = "ami-0fd3ac4abb734302a"
  instance_type = each.value
  tags = {
    Name = each.key
    env = var.env
  }
}
