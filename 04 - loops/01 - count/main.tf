resource "aws_instance" "web_server" {
  count = length(var.instances)
  ami = "ami-0fd3ac4abb734302a"
  instance_type = var.env == "dev" ? "t3.micro" : "t3.small"

  tags = {
    Name = count.index[var.instances]
    env = var.env
  }
}
