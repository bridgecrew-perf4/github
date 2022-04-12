locals {
  default_topics = ["hacktoberfest", "tedilabs"]
}

module "repository" {
  source  = "tedilabs/modules/github//modules/repository"
  version = "~> 0.8.0"

  for_each = {
    for repository in local.config.repositories :
    repository.name => repository
  }

  name        = each.key
  description = try(each.value.description, "Managed by Terraform.")
  homepage    = try(each.value.homepage, null)

  visibility         = try(each.value.visibility, "private")
  is_template        = try(each.value.is_template, false)
  archived           = try(each.value.archived, false)
  archive_on_destroy = try(each.value.archive_on_destroy, true)

  template = try(each.value.template, {})

  features = try(each.value.features, ["ISSUES", "PROJECTS"])
  vulnerability_alerts   = try(each.value.vulnerability_alerts, false)

  topics = concat(
    local.default_topics,
    try(each.value.topics, []),
  )
  issue_labels = try(each.value.issue_labels, [])


  ## Branch
  branches       = try(each.value.branches, [])
  default_branch = try(each.value.default_branch, null)

  merge_strategies       = try(each.value.merge_strategies, ["SQUASH", "REBASE"])
  delete_branch_on_merge = try(each.value.delete_branch_on_merge, true)


  ## GitHub Pages
  pages_enabled       = try(each.value.pages.enabled, false)
  pages_cname         = try(each.value.pages.cname, null)
  pages_source_branch = try(each.value.pages.source.branch, "gh-pages")
  pages_source_path   = try(each.value.pages.source.path, "/")


  ## Access Control
  read_teams     = try(each.value.permissions.read.teams, [])
  triage_teams   = try(each.value.permissions.triage.teams, [])
  write_teams    = try(each.value.permissions.write.teams, [])
  maintain_teams = try(each.value.permissions.maintain.teams, [])
  admin_teams    = try(each.value.permissions.admin.teams, [])

  read_collaborators     = try(each.value.permissions.read.collaborators, [])
  triage_collaborators   = try(each.value.permissions.triage.collaborators, [])
  write_collaborators    = try(each.value.permissions.write.collaborators, [])
  maintain_collaborators = try(each.value.permissions.maintain.collaborators, [])
  admin_collaborators    = try(each.value.permissions.admin.collaborators, [])

  deploy_keys = try(each.value.deploy_keys, [])
}
