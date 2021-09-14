

resource "aci_rest" "bpduguard_enabled" {
  path       = "/api/node/mo/uni/infra.json"
  class_name = "stpIfPol"
  content = {
    "name" = "bpduguard_enabled"
    "ctrl" = "bpdu-guard"
  }
}
