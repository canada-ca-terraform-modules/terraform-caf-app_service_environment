variable "tags" {
  description = "Maps of tags that will be applied to the resource"
  type = map(string)
  default = {}
}

variable "env" {
  description = "(Required) Env value for the name of the resource"
  type = string
}

variable "group" {
  description = "(Required) Group value for the name of the resource"
  type = string
}

variable "project" {
  description = "(Required) Project value for the name of the resource"
  type = string
}

variable "userDefinedString" {
  description = "(Required) UserDefinedString value for the name of the resource"
  type = string
}

variable "resource_groups" {
  description = "Resouce group object containing a list of resource group in the target project"
  type = any
  default = null
}

variable "subnets" {
  description = "Subnet object containing a list of subnets in the target project"
  type = any
  default = null
}

variable "appServiceEnvironment" {
  description = "Object containing all parameters for the app service environment"
  type = any
  default = {}
}