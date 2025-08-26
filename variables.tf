variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
  default = "tango"
}

variable "resource_group_location" {
  description = "The Azure region where the Resource Group should be created"
  type        = string
  default     = "East US"
}

variable "resource_group_tags" {
  description = "Tags to assign to the Resource Group"
  type        = map(string)
  default     = {
    environment = "dev"
    owner       = "terraform"
  }
}

