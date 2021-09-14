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

# provider "aci"{
#       username = "nikitahash"
#       url = "https://10.10.20.14"
#       password = var.password
#       cert_name = "admin"
# }
resource "aci_tenant" "tenant" {
  name        = var.tenant_name
  description = "This tenant is created by terraform"
}

resource "aci_application_profile" "app_profile" {
  tenant_dn   = "${aci_tenant.tenant.id}"
  name        = "${var.tenant_name}-ap"
  description = "${var.tenant_name} app"
}

resource "aci_vrf" "vrf" {
  tenant_dn              = "${aci_tenant.tenant.id}"
  name                   = "${var.tenant_name}_vrf"
  annotation             = "tag_vrf"
  bd_enforced_enable     = "no"
  ip_data_plane_learning = "enabled"
  knw_mcast_act          = "permit"
  name_alias             = "alias_vrf"
  pc_enf_dir             = "egress"
  pc_enf_pref            = "unenforced"
}

resource "aci_bridge_domain" "bd" {
  tenant_dn                   = "${aci_tenant.tenant.id}"
  #"${aci_tenant.tenant_for_bd.id}"
  description                 = "bridge domain"
  name                        = "${var.tenant_name}_bd"
  #relation_fv_rs_ctx          = "${aci_vrf.vrf.name}"
  optimize_wan_bandwidth      = "no"
  annotation                  = "tag_bd"
  arp_flood                   = "yes"
  ep_clear                    = "no"
  ep_move_detect_mode         = "garp"
  host_based_routing          = "no"
  intersite_bum_traffic_allow = "yes"
  intersite_l2_stretch        = "yes"
  ip_learning                 = "yes"
  limit_ip_learn_to_subnets   = "yes"
  mcast_allow                 = "yes"
  multi_dst_pkt_act           = "bd-flood"
  name_alias                  = "alias_bd"
  bridge_domain_type          = "regular"
  unicast_route               = var.unicast_route
  unk_mac_ucast_act           = "flood"
  unk_mcast_act               = "flood"
  vmac                        = "not-applicable"
}

resource "aci_application_epg" "epg" {
  application_profile_dn = "${aci_application_profile.app_profile.id}"
  #relation_fv_rs_bd      = "${aci_bridge_domain.bd.name}"
  name                   = "${var.tenant_name}-epg"
  description            = "%s"
  annotation             = "tag_epg"
  exception_tag          = "0"
  flood_on_encap         = "disabled"
  has_mcast_source       = "no"
  is_attr_based_epg      = "no"
  match_t                = "AtleastOne"
  name_alias             = "alias_epg"
  pc_enf_pref            = "unenforced"
  pref_gr_memb           = "exclude"
  prio                   = "unspecified"
  shutdown               = "no"
}

resource "aci_subnet" "subnet" {
  parent_dn = "${aci_bridge_domain.bd.id}"
  ip               = var.gateway_address
  preferred        = "yes"
  scope            = ["private"]
  description      = "This subnet is created by terraform"
}
