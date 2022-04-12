module "team__primary" {
  source  = "tedilabs/modules/github//modules/org-team"
  version = "~> 0.8.0"

  for_each = {
    for team in local.config.teams.primary :
    replace(lower(team.name), "/[ _.]/", "-") => team
  }

  name        = each.value.name
  description = try(each.value.description, "Managed by Terraform.")
  is_secret   = try(each.value.is_secret, false)

  parent_id                  = null
  default_maintainer_enabled = try(each.value.default_maintainer_enabled, false)

  ldap_group_dn = try(each.value.ldap_group_dn, null)

  maintainers = try(each.value.maintainers, [])
  members     = try(each.value.members, [])
}

module "team__secondary" {
  source  = "tedilabs/modules/github//modules/org-team"
  version = "~> 0.8.0"

  for_each = {
    for team in local.config.teams.secondary :
    replace(lower(team.name), "/[ _.]/", "-") => team
  }

  name        = each.value.name
  description = try(each.value.description, "Managed by Terraform.")
  is_secret   = try(each.value.is_secret, false)

  parent_id                  = module.team__primary[replace(lower(each.value.parent_team), "/[ _.]/", "-")].id
  default_maintainer_enabled = try(each.value.default_maintainer_enabled, false)

  ldap_group_dn = try(each.value.ldap_group_dn, null)

  maintainers = try(each.value.maintainers, [])
  members     = try(each.value.members, [])
}
