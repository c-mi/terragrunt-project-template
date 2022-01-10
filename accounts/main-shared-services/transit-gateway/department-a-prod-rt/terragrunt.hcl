include "root" {
  path = find_in_parent_folders()
}

include "service" {
  path = "${dirname(find_in_parent_folders())}/../services/tgw-rt.hcl"
}

dependency "attachment" {
  config_path = "${dirname(find_in_parent_folders())}/department-a-prod/network/tgw-attachment"
}

dependency "shared_network" {
  config_path = "../main-shared-services-attachment"
}

dependency "ingress_network" {
  config_path = "../main-shared-services-ingress-attachment"
}

inputs = {
  transit_gateway_propagated_attachments = [
    dependency.shared_network.outputs.attachement_id,
    dependency.ingress_network.outputs.attachement_id,
  ]
}
