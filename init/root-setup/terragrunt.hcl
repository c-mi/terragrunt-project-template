locals {
  email = "example@email.com"
}

include "backend" {
  path = "../backend.hcl"
}

terraform {
  source = "../..//modules/root-setup-simple"
}

inputs = {
  organizational_units = {
    main         = ["security", "shared-services"]
    department-a = ["prod", "non-prod"]
  }

  accounts = {
    main-shared-services = {
      email                      = replace(local.email, "@", "+mgmt@")
      parent_name                = "main/shared-services"
      iam_user_access_to_billing = "DENY"
    }
    main-security = {
      email                      = replace(local.email, "@", "+sec@")
      parent_name                = "main/security"
      iam_user_access_to_billing = "DENY"
    }
    department-a-dev = {
      email                      = replace(local.email, "@", "+a.dev@")
      parent_name                = "department-a/non-prod"
      iam_user_access_to_billing = "DENY"
    }
    department-a-prod = {
      email                      = replace(local.email, "@", "+a.prod@")
      parent_name                = "department-a/prod"
      iam_user_access_to_billing = "DENY"
    }
  }

  state_bucket_name = "organization-state-bucket"
  state_bucket_path = path_relative_to_include()
}
