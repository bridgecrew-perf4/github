module "team" {
  source = "../modules/org-team"

  for_each = {
    for team in local.config.teams :
    team.name => team
  }

  name        = each.key
  description = try(each.value.description, null)
  is_secret   = try(each.value.is_secret, false)

  parent_id                  = try(each.value.parent_id, null)
  default_maintainer_enabled = try(each.value.default_maintainer_enabled, false)

  ldap_group_dn = try(each.value.ldap_group_dn, null)
}
