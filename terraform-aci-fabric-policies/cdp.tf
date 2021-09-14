terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
    }
  }
}

provider "aci" {
  # cisco-aci user name
  username = "admin"
  # cisco-aci password
  password = var.password
  # cisco-aci url
  url      = "https://10.10.20.14"
  insecure = true
}


resource "aci_cdp_interface_policy" "cdp_enabled" {
  name     = "CDP_ENABLED"
  admin_st = "enabled"
}
