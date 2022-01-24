variable "name" {
  description = "The name of the team."
  type        = string
}

variable "description" {
  description = "A description of the team."
  type        = string
  default     = null
}

variable "is_secret" {
  description = "If true, team is only visible to the people on the team and people with owner permissions."
  type        = bool
  default     = false
}

variable "parent_id" {
  description = "The ID of the parent team, if this is a nested team."
  type        = string
  default     = null
}

variable "default_maintainer_enabled" {
  description = "If true, adds the creating user as a default maintainer to the team."
  type        = bool
  default     = false
}

variable "ldap_group_dn" {
  description = "The LDAP Distinguished Name of the group where membership will be synchronized. Only available in GitHub Enterprise Server."
  type        = string
  default     = null
}
