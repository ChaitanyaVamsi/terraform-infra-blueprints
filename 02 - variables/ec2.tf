resource "aws_instance" "web_server" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  tags =var.ec2_tags
}

resource "aws_security_group" "web_server_sg" {

  name = var.sg_name

  ingress {
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = var.protocol
    cidr_blocks = var.cidr
  }

   egress {
    from_port = var.egress_from_port
    to_port = var.egress_to_port
    protocol = var.protocol
    cidr_blocks = var.cidr
  }

  tags = var.sg_tags

}