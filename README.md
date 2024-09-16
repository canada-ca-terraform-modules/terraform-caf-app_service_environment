## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | 4.0.0   |

## Inputs

| Name                    | Description                                                                    | Type        | Default | Required |
| ----------------------- | ------------------------------------------------------------------------------ | ----------- | ------- | :------: |
| appServiceEnvironment   | Object containing all parameters for the app service environment               | any         | {}      |    no    |
| env                     | (Required) Env value for the name of the resource                              | string      | n/a     |   yes    |
| group                   | (Required) Group value for the name of the resource                            | string      | n/a     |   yes    |
| private\_dns\_zone\_ids | List of Private DNS zone IDs for the target subscription                       | any         | null    |    no    |
| project                 | (Required) Project value for the name of the resource                          | string      | n/a     |   yes    |
| resource\_groups        | Resouce group object containing a list of resource group in the target project | any         | null    |    no    |
| subnets                 | Subnet object containing a list of subnets in the target project               | any         | null    |    no    |
| tags                    | Maps of tags that will be applied to the resource                              | map(string) | {}      |    no    |
| userDefinedString       | (Required) UserDefinedString value for the name of the resource                | string      | n/a     |   yes    |

## Outputs

| Name        | Description                   |
| ----------- | ----------------------------- |
| ase\_id     | Outputs the ID of the ASE     |
| ase\_name   | Outputs the name of the ASE   |
| ase\_object | Outputs the entire ASE object |
| dns\_suffix | n/a                           |

## Private DNS Zone

A Private DNS zone with the name \<ase name\>.appserviceenvironment.net is expected to be present at the creation of the ASE. It should be created in the L1_blueprint_base beforehand with a link to the target subscription and the core. The ASE module will create 3 DNS A records: one for @, one for * and for *.scm

## TFVARS parameter



| Parameter Name                         | Possible Values         | Required | Default                                |
| -------------------------------------- | ----------------------- | -------- | -------------------------------------- |
| resource_group                         | Name or ID              | Yes      | n/a                                    |
| subnet                                 | Name or ID              | Yes      | n/a                                    |
| allow_new_private_endpoint_connections | true,false              | No       | false                                  |
| internal_load_balancing_mode           | "Web, Publishing", None | No       | "Web, Publishing"                      |
| dedicated_host_count                   | 2                       | No       | null                                   |
| remote_debugging_enabled               | true,false              | No       | false                                  |
| zone_redundant                         | true,false              | No       | false                                  |
| dns_zone.name                          | string                  | No       | \<ase name\>.appserviceenvironment.net |
| dns_zone.resource_group                | Name or ID              | No       | DNS                                    |
| dns_zone.ttl                           | int                     | No       | 60                                     |

### cluster_setting Block

| Parameter Name | Possible Values | Required | Default |
| -------------- | --------------- | -------- | ------- |
| name           |                 | Yes      | n/a     |
| value          |                 | Yes      | n/a     |

