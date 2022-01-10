dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "${dirname(find_in_parent_folders())}/../modules/bastion-host"
}

inputs = {
  vpc_id    = dependency.vpc.outputs.vpc_id
  subnet_id = dependency.vpc.outputs.public_subnets[0]
}
