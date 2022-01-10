resource "aws_organizations_organization" "this" {
  aws_service_access_principals = var.aws_service_access_principals
  enabled_policy_types          = var.enabled_policy_types
  feature_set                   = var.feature_set
}

resource "aws_organizations_organizational_unit" "parent_level_ous" {
  for_each = toset(keys(var.organizational_units))

  name      = each.value
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "child_level_ous" {
  for_each = toset(flatten([for k, v in var.organizational_units : formatlist("%s/%s", k, v)]))

  name      = regex("[a-z0-9\\-\\_]+$", each.value)
  parent_id = aws_organizations_organizational_unit.parent_level_ous[regex("^[a-z0-9\\-\\_]+", each.value)].id
}

resource "aws_organizations_account" "this" {
  for_each = var.accounts

  name                       = each.key
  email                      = each.value.email
  iam_user_access_to_billing = try(each.value.iam_user_access_to_billing, null)
  parent_id                  = try(aws_organizations_organizational_unit.parent_level_ous[each.value.parent_name].id, aws_organizations_organizational_unit.child_level_ous[each.value.parent_name].id)
  tags                       = try(each.value.tags, {})
}
