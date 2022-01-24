module "project" {
  source = "../modules/project"

  for_each = {
    for project in local.config.projects :
    project.name => project
  }

  level = "ORGANIZATION"

  name        = each.key
  description = try(each.value.description, "Managed by Terraform.")
  columns     = try(each.value.columns, [])
}
