# Allows SSH access (port 22) to MongoDB instances
# Only from Bastion host security group
# This ensures MongoDB is not publicly accessible

resource "aws_security_group_rule" "allow_ssh_from_bastion_to_mongodb" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}