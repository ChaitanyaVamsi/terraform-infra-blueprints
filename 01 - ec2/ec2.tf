  # Security Group for the Web Server
  resource "aws_security_group" "web_server_sg" {
    name = "web-server-sg" # Name displayed in AWS console

    ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }


    tags = {
      Name        = "web-server-sg"
      Environment = "dev"
    }
  }

  # EC2 Instance (Web Server)
  resource "aws_instance" "web_server" {
    ami                    = "ami-0fd3ac4abb734302a"
    instance_type          = "t3.micro"
    vpc_security_group_ids = [aws_security_group.web_server_sg.id] # Attach the security group

    tags = {
      Name        = "web-server"
      Environment = "dev"
    }
  }

# --------------------------------------------------------
# Explanation:
# 1 Security Group:
#    - Acts as a firewall controlling inbound (ingress) and outbound (egress) traffic.
#    - In this example, all ports and protocols are open for learning purposes.
# 2 EC2 Instance:
#    - Virtual machine launched in AWS using the specified AMI and instance type.
#    - Linked to the security group for network access control.
# 3 Naming and Tags:
#    - Logical names (web_server_sg, web_server) are used in Terraform code.
#    - AWS 'name' and tags help identify resources in the AWS console.
#  Purpose:
#    - Demonstrates how Terraform manages AWS resources.
#    - Beginner-friendly example showing Security Group and EC2 creation.
# --------------------------------------------------------