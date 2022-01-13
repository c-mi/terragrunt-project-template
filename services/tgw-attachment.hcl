dependency "transit_gateway" {
  config_path = "${dirname(find_in_parent_folders())}/main-shared-services/transit-gateway/tgw"
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/../modules/transit-gateway-attachment"
}

inputs = {
  vpc_id                 = dependency.vpc.outputs.vpc_id
  subnet_ids             = dependency.vpc.outputs.private_subnets
  transit_gateway_id     = dependency.transit_gateway.outputs.ec2_transit_gateway_id
  default_route_table_id = dependency.transit_gateway.outputs.ec2_transit_gateway_propagation_default_route_table_id
}
