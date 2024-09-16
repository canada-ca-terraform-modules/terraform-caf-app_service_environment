output "ase_object" {
  description = "Outputs the entire ASE object"
  value = azurerm_app_service_environment_v3.ase
}

output "ase_id" {
  description = "Outputs the ID of the ASE"
  value = azurerm_app_service_environment_v3.ase.id
}

output "ase_name" {
  description = "Outputs the name of the ASE"
  value = azurerm_app_service_environment_v3.ase.name
}

output "dns_suffix" {
  value = azurerm_app_service_environment_v3.ase.dns_suffix
}