include "backend" {
  path = "../../backend.hcl"
}

include "provider" {
  path = "../provider.hcl"
}

inputs = {
  sec_account_id     = dependency.root.outputs.organization_all_accounts["main-security"].id
  deploy_account_id  = dependency.root.outputs.organization_all_accounts["main-shared-services"].id
  member_account_ids = [for k, v in dependency.root.outputs.organization_all_accounts : v.id]
  account_alias      = "c-mi-shared-services"

  create_state_bucket = true
  state_bucket_name   = "c-mi-main-shared-tf-state"
}
