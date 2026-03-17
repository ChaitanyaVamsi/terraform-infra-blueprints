resource "aws_instance" "bastion" {
  ami = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  # subnet_id is the AWS Subnet ID where this EC2 instance will be launched.
  # Its value comes from local.public_subnet_id, e.g., "subnet-aaa111".
  # Choosing a public subnet allows internet access; private subnet keeps it internal.

  subnet_id = local.pubic_subnet_id
  iam_instance_profile = "bastion_profile"
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  user_data = file("bastion.sh")
  tags = merge(
    local.common_tags,
    {Name = "${var.project_name}-${var.environment}-bastion"}
  )
}