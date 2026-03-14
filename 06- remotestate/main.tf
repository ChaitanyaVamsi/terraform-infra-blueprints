resource "aws_instance" "web_server" {
  ami = data.aws_ami.ami_name.id
  instance_type = "t3.micro"
  tags = {
    Name = "webServer"
  }
}