output "organization" {
  value = module.organization["tedilabs"]
}

output "teams" {
  value = {
    primary   = module.team__primary
    secondary = module.team__secondary
  }
}

output "projects" {
  value = module.project
}
