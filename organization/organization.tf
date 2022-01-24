module "organization" {
  source = "../modules/org-organization"

  for_each = {
    for organization in [local.config.organization] :
    organization.name => organization
  }

  name = each.key

  owners  = try(each.value.owners, [])
  members = try(each.value.members, [])

  blocked_users = try(each.value.blocked_users, [])
}
