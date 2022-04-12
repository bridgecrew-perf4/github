module "project" {
  source  = "tedilabs/modules/github//modules/project"
  version = "~> 0.8.0"

  for_each = {
    for project in local.config.projects :
    project.name => project
  }

  level = "ORGANIZATION"

  name        = each.key
  description = try(each.value.description, "Managed by Terraform.")
  columns     = try(each.value.columns, [])
}
