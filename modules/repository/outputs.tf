output "name" {
  description = "The name of the repository."
  value       = github_repository.this.name
}

output "description" {
  description = "The description of the repository."
  value       = github_repository.this.description
}

output "visibility" {
  description = "The visibility of the repository. Can be `public`, `private` or `internal`."
  value       = github_repository.this.visibility
}

output "features" {
  description = "A list of available features on the repository."
  value       = var.features
}

output "merge_strategies" {
  description = "A list of available strategies for merging pull requests on the repository."
  value       = var.merge_strategies
}

output "delete_branch_on_merge" {
  description = "Automatically delete head branch after a pull request is merged."
  value       = github_repository.this.delete_branch_on_merge
}

output "topics" {
  description = "A list of topics for the repository."
  value       = github_repository.this.topics
}

output "permissions" {
  description = "The access control list which manage individual and team access to the repository."
  value = {
    read = {
      teams         = var.read_teams
      collaborators = var.read_collaborators
    }
    triage = {
      teams         = var.triage_teams
      collaborators = var.triage_collaborators
    }
    write = {
      teams         = var.write_teams
      collaborators = var.write_collaborators
    }
    maintain = {
      teams         = var.maintain_teams
      collaborators = var.maintain_collaborators
    }
    admin = {
      teams         = var.admin_teams
      collaborators = var.admin_collaborators
    }
  }
}

output "deploy_keys" {
  description = "A list of deploy keys granted access to the repository."
  value = {
    for key in var.deploy_keys :
    key.name => key
  }
}
