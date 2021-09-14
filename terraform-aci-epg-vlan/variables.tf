variable "tenant_name" {
  description = "ACI tenant name"
  type = string
}

variable "password" {
  description = "administrator password"
  type        = string
  sensitive   = true
}

variable "gateway_address" {
  description = "The default gateway for the segment example 10.10.1.1/24"
  type = string
}

variable "unicast_route" {
  description = "Enables or disables unicast routing for the BD (yes/no)"
  default     = "no"
}