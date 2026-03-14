variable "instance" {
  default = "t3.micro"
}

variable "project" {
  default = "app"
}

variable "env" {
  default = "dev"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name = "merstackapp"
    user = "axle"
    team = "qa"
  }
}