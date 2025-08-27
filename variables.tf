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

variable "virtual_network_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "tango-vnet"
}
variable "virtual_network_address_space" {
  description = "The address space of the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
  default     = "tango-subnet"
}
variable "subnet_address_prefixes" {
  description = "The address prefixes of the Subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}
variable "subnet_service_endpoints" {
  description = "The service endpoints of the Subnet"
  type        = list(string)
  default     = ["Microsoft.Storage", "Microsoft.Sql"]
}
variable "virtual_network_tags" {
  description = "Tags to assign to the Virtual Network"
  type        = map(string)
  default     = {
    environment = "dev"
    owner       = "terraform"
  }
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group"
  type        = string
  default     = "tango-nsg"
}

variable "network_security_group_tags" {
  description = "Tags to assign to the Network Security Group"
  type        = map(string)
  default     = {
    environment = "dev"
    owner       = "terraform"
  }
}

variable "network_security_rules" {
  description = "A map of network security rules to create within the Network Security Group"
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = {
    allow_ssh = {
      name                       = "Allow-SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    allow_http = {
      name                       = "Allow-HTTP"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    allow_https = {
      name                       = "Allow-HTTPS"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    allow_rdp = {
      name                       = "Allow-RDP"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }
  
}
}




