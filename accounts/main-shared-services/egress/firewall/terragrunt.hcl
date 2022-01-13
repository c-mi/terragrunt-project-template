include "root" {
  path = find_in_parent_folders()
}

include "service" {
  path = "${dirname(find_in_parent_folders())}/../services/${basename(get_terragrunt_dir())}.hcl"
}

inputs = {
  cidr = "10.0.32.0/20"

  azs             = ["eu-west-1a", "eu-west-1b"]
  intra_subnets   = ["10.0.32.0/24", "10.0.33.0/24"]
  private_subnets = ["10.0.34.0/24", "10.0.35.0/24"]
  public_subnets  = ["10.0.36.0/24", "10.0.37.0/24"]

}
