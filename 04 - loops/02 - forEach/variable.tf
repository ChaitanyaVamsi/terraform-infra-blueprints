variable "instance" {
  default = {
    mongo = "t3.micro"
    rabbitmq = "t3.micro"
    mysql = "t3.small"

  }
}

variable "env" {
  default = "dev"
}

variable "zone_id" {
  default = "Z103025810WRVMV3MH616"
}

variable "domain_name" {
  default = "cloudops.store"
}
