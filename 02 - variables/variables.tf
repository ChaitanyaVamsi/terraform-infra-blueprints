variable "ami_id" {
  type = string
  default = "ami-0fd3ac4abb734302a"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "web-server"
    Environment = "dev"
  }
}

//resource is security group

variable "sg_name" {
  type = string
  default = "web-server-sg"
}

variable "ingress_from_port" {
  type    = number
  default = 0
}

variable "ingress_to_port" {
  //even if we do not specify type it sets automatically
  default = 0
}

variable "egress_from_port" {
  default = 0
}

variable "egress_to_port" {
  default = 0
}

variable "protocol" {
  default = -1
}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  type = map(any)
  default = {
    Name        = "web-server-sg"
    Environment = "dev"
  }
}
