resource "azurerm_app_service_environment_v3" "ase" {
  name = local.ase-name
  resource_group_name = local.resource_group_name
  subnet_id = local.subnet_id

  allow_new_private_endpoint_connections = try(var.appServiceEnvironmment.allowallow_new_private_endpoint_connections, false)
  dedicated_host_count = try(var.appServiceEnvironmment.dedicated_host_count, null)
  remote_debugging_enabled = try(var.appServiceEnvironmment.remote_debugging_enabled, false)
  zone_redundant = try(var.appServiceEnvironmment.zone_redundant, null)
  internal_load_balancing_mode = try(var.appServiceEnvironmment.internal_load_balancing_mode, "Web, Publishing")

  dynamic "cluster_setting" {
    for_each = try(var.appServiceEnvironmment.cluster_setting, {})
    content {
      name = cluster_setting.value["name"]
      value = cluster_setting.value["value"]
    }
  }

  tags = merge(var.tags, try(var.appServiceEnvironmment.tags, {}))

  lifecycle {
    ignore_changes = [ tags ]
  }

  timeouts {
    create = "6h0m"
    update = "6h0m"
    read = "5m"
    delete = "6h0m"
  }
}

# module "private_dns_zone" {
#   source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-private_dns_zone.git?ref=v1.0.1"

#   name = azurerm_app_service_environment_v3.ase.dns_suffix
#   resource_groups = var.resource_groups
#   vnet_id = var.vnet_id
#   private_dns_zone = {
#     resource_group = "DNS"
#   }
#   tags = var.tags
# }

# resource "azurerm_private_dns_zone_virtual_network_link" "privatezone1-vnet-as_link" {
#   name = lower("${var.project}_privatezone1-vnet-as_link")
#   resource_group_name = var.resource_groups.DNS.name
#   private_dns_zone_name = module.private_dns_zone.private_dns_zone_name
#   virtual_network_id = var.vnet_id
#   tags = var.tags
# }




