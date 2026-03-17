variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    default = [

        "mongodb", "redis", "mysql", "rabbitmq",
        "bastion",
        # frontend load balancer
        "ingress_alb",
        "open_vpn",
        "eks_control_plane",
        "eks_node"
    ]
}