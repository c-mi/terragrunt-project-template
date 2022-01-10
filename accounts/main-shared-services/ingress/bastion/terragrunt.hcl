include "root" {
  path = find_in_parent_folders()
}

include "service" {
  path = "${dirname(find_in_parent_folders())}/../services/${basename(get_terragrunt_dir())}.hcl"
}

inputs = {
  allowed_cidrs = ["165.225.207.40/32"]
}
