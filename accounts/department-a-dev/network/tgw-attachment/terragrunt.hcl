include "root" {
  path = find_in_parent_folders()
}

include "service" {
  path = "${dirname(find_in_parent_folders())}/../services/${basename(get_terragrunt_dir())}.hcl"
}
