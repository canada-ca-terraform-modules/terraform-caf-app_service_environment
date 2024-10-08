resource "azurerm_app_service_environment_v3" "ase" {
  name = local.ase-name
  resource_group_name = local.resource_group_name
  subnet_id = local.subnet_id

  # Optional Parameters
  allow_new_private_endpoint_connections = try(var.appServiceEnvironment.allowallow_new_private_endpoint_connections, false)
  dedicated_host_count = try(var.appServiceEnvironment.dedicated_host_count, null)
  remote_debugging_enabled = try(var.appServiceEnvironment.remote_debugging_enabled, false)
  zone_redundant = try(var.appServiceEnvironment.zone_redundant, false)
  internal_load_balancing_mode = try(var.appServiceEnvironment.internal_load_balancing_mode, "Web, Publishing")

  dynamic "cluster_setting" {
    for_each = try(var.appServiceEnvironment.cluster_setting, {})
    content {
      name = cluster_setting.value["name"]
      value = cluster_setting.value["value"]
    }
  }
  tags = merge(var.tags, try(var.appServiceEnvironment.tags, {}))

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

# DNS record required. They are mapped to the ASE LB
resource "azurerm_private_dns_a_record" "a_record1" {
  zone_name = try(var.appServiceEnvironment.dns_zone.name, azurerm_app_service_environment_v3.ase.dns_suffix)
  name = "@"
  ttl = try(var.appServiceEnvironment.dns_zone.ttl, 60)
  records = azurerm_app_service_environment_v3.ase.internal_inbound_ip_addresses
  resource_group_name = local.dns_rg_name
  tags = var.tags
}

resource "azurerm_private_dns_a_record" "a_record2" {
  zone_name = try(var.appServiceEnvironment.dns_zone.name, azurerm_app_service_environment_v3.ase.dns_suffix)
  name = "*"
  ttl = try(var.appServiceEnvironment.dns_zone.ttl, 60)
  records = azurerm_app_service_environment_v3.ase.internal_inbound_ip_addresses
  resource_group_name = local.dns_rg_name
  tags = var.tags
}

resource "azurerm_private_dns_a_record" "a_record3" {
  zone_name = try(var.appServiceEnvironment.dns_zone.name, azurerm_app_service_environment_v3.ase.dns_suffix)
  name = "*.scm"
  ttl = try(var.appServiceEnvironment.dns_zone.ttl, 60)
  records = azurerm_app_service_environment_v3.ase.internal_inbound_ip_addresses
  resource_group_name = local.dns_rg_name
  tags = var.tags
}



