locals {
   resource_group_name = strcontains(var.appServiceEnvironmment, "/resourceGroups/") ? regex("[^\\/]+$", var.appServiceEnvironmment) :  var.resource_groups[var.appServiceEnvironmment].name

   subnet_id = strcontains(var.appServiceEnvironmment.subnet, "/resourceGroups/") ? var.appServiceEnvironmment.subnet : var.subnets[var.appServiceEnvironmment.subnet].id
}