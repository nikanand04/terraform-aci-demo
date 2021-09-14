

resource "aci_rest" "ifpol_1G" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "fabricHIfPol"
  content = {
    "dn"      = "uni/infra/hintfpol-1G"
    "speed"   = "1G"
    "name"    = "1G"
    "autoNeg" = "on"
  }
}

resource "aci_rest" "ifpol_10G" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "fabricHIfPol"
  content = {
    "dn"      = "uni/infra/hintfpol-10G"
    "speed"   = "10G"
    "name"    = "10G"
    "autoNeg" = "on"
  }
}

resource "aci_rest" "ifpol_25G" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "fabricHIfPol"
  content = {
    "dn"      = "uni/infra/hintfpol-25G"
    "speed"   = "25G"
    "name"    = "25G"
    "autoNeg" = "on"
  }
}

resource "aci_rest" "ifpol_40G" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "fabricHIfPol"
  content = {
    "dn"      = "uni/infra/hintfpol-40G"
    "speed"   = "40G"
    "name"    = "40G"
    "autoNeg" = "on"
  }
}

resource "aci_rest" "ifpol_100G" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "fabricHIfPol"
  content = {
    "dn"      = "uni/infra/hintfpol-100G"
    "speed"   = "100G"
    "name"    = "100G"
    "autoNeg" = "on"
  }
}
