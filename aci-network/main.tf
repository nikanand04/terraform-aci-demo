# Terraform
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "nikita_hashi"
    workspaces {
      name = "hc-aci-network"
    }
  }
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = "0.7.1"
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

# Resources
# Fabric Policies
module "fabric-policies" {
  source  = "app.terraform.io/nikita_hashi/fabric-policies/aci"
  version = "0.2.2"
  password = var.password
}

# # VLANs
module "vlan1" {
  source  = "app.terraform.io/nikita_hashi/epg-vlan/aci"
  version = "0.2.6"
  tenant_name     = "ACMEA-tenant"
  gateway_address = "10.10.1.1/24"
  password=var.password
}

module "vlan2" {
#  # source  = "app.terraform.io/dstover/epg-vlan/aci"
   source  = "app.terraform.io/nikita_hashi/epg-vlan/aci"
   version = "0.2.6"
   tenant_name     = "ACMEB-tenant"
   gateway_address = "10.10.2.1/24"
   unicast_route   = "yes"
   password=var.password
 }

# module "vlan3" {
# #  source  = "app.terraform.io/dstover/epg-vlan/aci"
#   source  = "app.terraform.io/nikita_hashi/epg-vlan/aci"
#   version = "0.2.4"
#   tenant_name     = "ACMEC-tenant"
#   gateway_address = "10.10.4.1/24"
#   unicast_route   = "yes"
#   password=var.password
# }
