# Cycloid vars
variable "project" {
  description = "Cycloid project name."
}

variable "env" {
  description = "Cycloid environment name."
}

variable "customer" {
  description = "Cycloid customer name."
}

variable "location" {
    description     = "Azure location of the resource group"
    type            = string
    
    validation {
        condition = anytrue([
            var.location == "west europe",
            var.location == "north europe",
            var.location == "east us"
        ])
        error_message = "STOP! The location must be either 'west europe', 'north europe', or 'east us' and lower case."
    }
}

# Adding local tags to reflect usual ways of working in Cycloid stacks
variable "extra_tags" {
  description = "Extra tags to add to all resources in this module."
  default     = {}
}

locals {
  standard_tags = {
    "cycloid"    = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}
