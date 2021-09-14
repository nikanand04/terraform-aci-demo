variable "url" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  description = "administrator password"
  type        = string
  sensitive   = true
}

# variable "password_fb" {
#   description = "administrator password"
#   type        = string
#   sensitive   = true
# }

# variable "cert_name" {
#   default = "terraform"
#   type = string
# }

# variable "private_key_data" {
#   type = string
# }
