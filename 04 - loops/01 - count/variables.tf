variable "env" {
  type    = string
  default = "dev"

  validation {
    # Checks if the provided env value exists in the allowed list
    condition     = contains(["dev","qa","prod"], var.env)

    # Error message shown if validation fails
    error_message = "env must be dev, qa, or prod."
  }
}

variable "instances" {
  default = ["mongo","redis","sql"]
}