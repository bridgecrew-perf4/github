resource "github_team" "this" {
  name        = var.name
  description = try(var.description, null)
  privacy     = var.is_secret ? "secret" : "closed"

  parent_team_id            = try(var.parent_id, null)
  create_default_maintainer = var.default_maintainer_enabled

  ldap_dn = try(var.ldap_group_dn, null)
}
