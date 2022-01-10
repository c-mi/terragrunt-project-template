include "backend" {
  path = "../../backend.hcl"
}

include "provider" {
  path = "../provider.hcl"
}

inputs = {
  sec_account_id      = dependency.root.outputs.organization_all_accounts["main-security"].id
  deploy_account_id   = dependency.root.outputs.organization_all_accounts["main-shared-services"].id
  member_account_ids  = [for k, v in dependency.root.outputs.organization_all_accounts : v.id]
  account_alias       = "c-mi-security"
  root_state_file_arn = dependency.root.outputs.state_file_arn
  root_state_kms_key  = dependency.root.outputs.kms_key_arn

  users = {
    "c-mi" = {
      pgp_key = "keybase:cmiwork"
      groups  = ["deployment"]
    }
  }
}
