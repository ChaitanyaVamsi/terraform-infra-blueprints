# Data sources in Terraform are used to fetch information about existing resources so they can be used in Terraform configurations.
data "aws_ami" "ami_name" {

  most_recent = true

  owners = ["309956199498"]

  filter {
    name   = "name"
    values = ["RHEL-10.0.0_HVM-20250730-x86_64-0-Hourly2-GP3"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_check" {
  value = data.aws_ami.ami_name.id
}


data "aws_instance" "mysql" { # this is manual instance created by someone
  instance_id = "i-0b3a352bab3262cc9"

}

output "mysql_info" { # refer https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance#example-usage
  value = data.aws_instance.mysql
}
