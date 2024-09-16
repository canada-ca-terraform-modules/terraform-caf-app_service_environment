variable "AppServiceEnvironment" {
  description = "Object containing the configuration of the ASE to deploy"
  type = any
  default = {}
}

module "AppServiceEnvironment" {
  source = "github.com/canada-ca-terraform-modules/terraform-caf-app_service_environment.git?ref=v1.0.0"
  for_each = var.AppServiceEnvironment

  userDefinedString = each.key
  env = var.env
  group = var.group
  project = var.project
  resource_groups = local.resource_groups_all
  subnets = local.subnets
  appServiceEnvironment = each.value
  tags = var.tags
}


