include "root" {
  path = find_in_parent_folders()
}

include "service" {
  path = "${dirname(find_in_parent_folders())}/../services/tgw-attachment.hcl"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  attach_default_route_table = true
}
