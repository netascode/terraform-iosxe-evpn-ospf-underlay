module "iosxe_evpn_ospf_underlay" {
  source  = "netascode/evpn-ospf-underlay/iosxe"
  version = ">= 0.1.0"

  leafs           = ["LEAF-1", "LEAF-2"]
  spines          = ["SPINE-1", "SPINE-2"]
  loopback_id     = 0
  pim_loopback_id = 100

  loopbacks = [
    {
      device       = "SPINE-1",
      ipv4_address = "10.1.100.1"
    },
    {
      device       = "SPINE-2",
      ipv4_address = "10.1.100.2"
    },
    {
      device       = "LEAF-1",
      ipv4_address = "10.1.100.3"
    },
    {
      device       = "LEAF-2",
      ipv4_address = "10.1.100.4"
    }
  ]

  vtep_loopback_id = 1

  vtep_loopbacks = [
    {
      device       = "LEAF-1",
      ipv4_address = "10.1.200.1"
    },
    {
      device       = "LEAF-2",
      ipv4_address = "10.1.200.2"
    }
  ]

  fabric_interface_type         = "GigabitEthernet"
  leaf_fabric_interface_prefix  = "1/0/"
  leaf_fabric_interface_offset  = "1"
  spine_fabric_interface_prefix = "1/0/"
  spine_fabric_interface_offset = "1"
  anycast_rp_ipv4_address       = "10.1.101.1"
}
