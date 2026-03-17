# ECR repository for the "catalogue" service of the project
# - Mutable tags for CI/CD flexibility
# - Automatic vulnerability scanning on push
# - Force deletion allows removal of repo even if it has images

resource "aws_ecr_repository" "catalogue" {
  name                 = "${var.project_name}/catalogue"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true
}

resource "aws_ecr_repository" "user" {
  name                 = "${var.project_name}/user"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true
}

resource "aws_ecr_repository" "cart" {
  name                 = "${var.project_name}/cart"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true
}

resource "aws_ecr_repository" "shipping" {
  name                 = "${var.project_name}/shipping"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true
}

resource "aws_ecr_repository" "payment" {
  name                 = "${var.project_name}/payment"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true
}

resource "aws_ecr_repository" "frontend" {
  name                 = "${var.project_name}/frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true
}

# SIMPLY LOOP IT
# variable "services" {
#   type    = list(string)
#   default = ["catalogue", "user", "cart"]
# }

# resource "aws_ecr_repository" "services" {
#   for_each = toset(var.services)

#   name                 = "${var.project_name}/${each.value}"
#   image_tag_mutability = "MUTABLE"

#   image_scanning_configuration {
#     scan_on_push = true
#   }

#   force_delete = true
# }