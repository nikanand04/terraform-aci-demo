

resource "aci_rest" "storm_control" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "stormctrlIfPol"
  content = {
    "dn"        = "uni/infra/stormctrlifp-storm-control-20"
    "name"      = "storm-control-20"
    "rate"      = "20"
    "burstRate" = "20"
  }
}
