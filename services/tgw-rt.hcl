dependency "transit_gateway" {
  config_path = "${dirname(find_in_parent_folders())}/main-shared-services/transit-gateway/tgw"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/../modules/transit-gateway-route-table"
}

inputs = {
  transit_gateway_id            = dependency.transit_gateway.outputs.ec2_transit_gateway_id
  transit_gateway_attachment_id = dependency.attachment.outputs.attachement_id
}
