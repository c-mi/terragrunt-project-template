include "root" {
  path = find_in_parent_folders()
}

include "service" {
  path = "${dirname(find_in_parent_folders())}/../services/tgw-rt.hcl"
}

dependency "attachment" {
  config_path = "${dirname(find_in_parent_folders())}/department-a-dev/network/tgw-attachment"
}

dependency "shared_network" {
  config_path = "${dirname(find_in_parent_folders())}/main-shared-services/network/tgw-attachment"
}

inputs = {
  transit_gateway_propagated_attachments = [
    dependency.shared_network_attachment.outputs.id,
  ]
}
