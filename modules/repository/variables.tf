variable "name" {
  description = "(Required) A name of the repository."
  type        = string
}

variable "description" {
  description = "(Optional) A description of the repository."
  type        = string
  default     = "Managed by Terraform."
}

variable "visibility" {
  description = "(Optional) Can be `public`, `private` or `internal`. `internal` visibility is only available if your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+."
  type        = string
  default     = "private"
}

variable "features" {
  description = "(Optional) A list of enabled features on the repository. Available features: `ISSUES`, `PROJECTS`, `WIKI`."
  type        = set(string)
  default     = ["ISSUES"]

  validation {
    condition = alltrue([
      for feature in var.features :
      contains(["ISSUES", "PROJECTS", "WIKI"], feature)
    ])
    error_message = "Available features: `ISSUES`, `PROJECTS`, `WIKI`."
  }
}

variable "merge_strategies" {
  description = "(Optional) A list of allowed strategies for merging pull requests on the repository. Available strategies: `MERGE_COMMIT`, `SQUASH`, `REBASE`."
  type        = set(string)
  default     = ["SQUASH", "REBASE"]

  validation {
    condition = alltrue([
      for strategy in var.merge_strategies :
      contains(["MERGE_COMMIT", "SQUASH", "REBASE"], strategy)
    ])
    error_message = "Available strategies: `MERGE_COMMIT`, `SQUASH`, `REBASE`."
  }
}

variable "delete_branch_on_merge" {
  description = "(Optional) Automatically delete head branch after a pull request is merged. Defaults to true."
  type        = bool
  default     = true
}

variable "topics" {
  description = "(Optional) A list of topics for the repository."
  type        = set(string)
  default     = []
}

variable "read_teams" {
  description = "(Optional) A list of teams with `read` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "triage_teams" {
  description = "(Optional) A list of teams with `triage` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "write_teams" {
  description = "(Optional) A list of teams with `write` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "maintain_teams" {
  description = "(Optional) A list of teams with `maintain` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "admin_teams" {
  description = "(Optional) A list of teams with `admin` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "read_collaborators" {
  description = "(Optional) A list of users as collaborator with `read` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "triage_collaborators" {
  description = "(Optional) A list of users as collaborator with `triage` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "write_collaborators" {
  description = "(Optional) A list of users as collaborator with `write` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "maintain_collaborators" {
  description = "(Optional) A list of users as collaborator with `maintain` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "admin_collaborators" {
  description = "(Optional) A list of users as collaborator with `admin` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "deploy_keys" {
  description = <<EOF
  (Optional) A list of deploy keys to grant access to the repository. A deploy key is a SSH key. Each member of `deploy_keys` block as defined below.
    (Required) `name` - A name of deploy key.
    (Optional) `key` - A SSH key. Begins with 'ssh-rsa', 'ecdsa-sha2-nistp256', 'ecdsa-sha2-nistp384', 'ecdsa-sha2-nistp521', 'ssh-ed25519', 'sk-ecdsa-sha2-nistp256@openssh.com', or 'sk-ssh-ed25519@openssh.com'.
    (Optional) `writable` - Whether to allow write access to the repository. The key can be used to push to the repository if enabled.
  EOF
  type = list(object({
    name     = string
    key      = string
    writable = bool
  }))
  default = []
}
