terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tedilabs"

    workspaces {
      name = "github-cloud-tedilabs-organization"
    }
  }
}


###################################################
# Local Variables
###################################################

locals {
  context = yamldecode(file(var.config_file)).context
  config  = yamldecode(templatefile(var.config_file, local.context))
}


###################################################
# Providers
###################################################

provider "github" {
  owner = local.context.organization
}
