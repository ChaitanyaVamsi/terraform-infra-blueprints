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

resource "aws_security_group_rule" "allow_ssh_from_bastion_to_redis" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}

resource "aws_security_group_rule" "allow_ssh_from_bastion_to_mysql" {
  type                     = "ingress"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}

resource "aws_security_group_rule" "allow_ssh_from_bastion_to_rabbitmq" {
  type                     = "ingress"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}

##### Frontend ALB SG RUles #####
# Allows HTTPS (port 443) access to the ALB from anywhere on the internet.
# This makes the application publicly accessible over secure HTTPS.
resource "aws_security_group_rule" "allow_https_from_internet_to_alb" {
  type              = "ingress"
  security_group_id = local.ingress_alb_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

##### Bastion SG Rules #####
resource "aws_security_group_rule" "allow_ssh_from_internet_to_bastion" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# Allow HTTPS (443) access to the EKS control plane from the Bastion host
resource "aws_security_group_rule" "allow_https_from_bastion_to_eks_control_plane" {
  type                     = "ingress"
  security_group_id        = local.eks_control_plane_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 443
  protocol                 = "tcp"
  to_port                  = 443
}

# Allows SSH (port 22) access to EKS worker nodes
# only from the Bastion host security group
resource "aws_security_group_rule" "allow_ssh_from_bastion_to_eks_nodes" {
  type                     = "ingress"
  security_group_id        = local.eks_node_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}

# EKS control plane can send all traffic to EKS worker nodes
# Allows all traffic (all ports and protocols) from EKS control plane
# to EKS worker nodes for cluster management and communication
resource "aws_security_group_rule" "allow_all_from_eks_control_plane_to_eks_nodes" {
  type                     = "ingress"
  security_group_id        = local.eks_node_sg_id
  source_security_group_id = local.eks_control_plane_sg_id
  from_port                = 0
  protocol                 = "-1"
  to_port                  = 0
}



# EKS worker nodes can send all traffic to EKS control plane
# Allows all traffic (all ports and protocols) from EKS worker nodes
# to EKS control plane for cluster communication and management
resource "aws_security_group_rule" "allow_all_from_eks_nodes_to_eks_control_plane" {
  type                     = "ingress"
  security_group_id        = local.eks_control_plane_sg_id
  source_security_group_id = local.eks_node_sg_id
  from_port                = 0
  protocol                 = "-1"
  to_port                  = 0
}

# Allow all traffic from VPC CIDR to EKS worker nodes
# Any resource inside the VPC can communicate with EKS nodes on any port
# This rule allows all traffic from entire VPC to EKS nodes.
# Not recommended for production as it is overly permissive.
# Prefer using specific security groups for controlled access.

resource "aws_security_group_rule" "allow_all_from_vpc_to_eks_nodes" {
  type              = "ingress"
  security_group_id = local.eks_node_sg_id
  cidr_blocks       = ["10.0.0.0/16"]
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
}


# Allows nodes to talk to each other
# This also allows pods on different nodes to communicate, because pods are on the nodes
# More controlled than allowing the entire VPC CIDR

# resource "aws_security_group_rule" "allow_all_between_eks_nodes" {
#   type                     = "ingress"
#   security_group_id        = local.eks_node_sg_id   # target
#   source_security_group_id = local.eks_node_sg_id   # source
#   protocol                 = "-1"
#   from_port                = 0
#   to_port                  = 0
# }