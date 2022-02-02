locals {
  remote_states = {
    for name, remote_state in data.terraform_remote_state.this :
    name => remote_state.outputs
  }
}


###################################################
# Terraform Remote States (External Dependencies)
###################################################

data "terraform_remote_state" "this" {
  for_each = local.config.remote_states

  backend = "remote"

  config = {
    organization = each.value.organization
    workspaces = {
      name = each.value.workspace
    }
  }
}
