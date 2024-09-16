locals {
  resource_group_name = strcontains(var.appServiceEnvironment.resource_group, "/resourceGroups/") ? regex("[^\\/]+$", var.appServiceEnvironment.resource_group) : var.resource_groups[var.appServiceEnvironment.resource_group].name
  subnet_id           = strcontains(var.appServiceEnvironment.subnet, "/resourceGroups/") ? var.appServiceEnvironment.subnet : var.subnets[var.appServiceEnvironment.subnet].id
  dns_rg_name = try(strcontains(var.appServiceEnvironment.dns-zone.resource_group, "/resourceGroups/") ? regex("[^\\/]+$", var.appServiceEnvironment.dns-zone.resource_group) : var.resource_groups[var.appServiceEnvironment.dns-zone.resource_group].name, var.resource_groups.DNS.name)
}
