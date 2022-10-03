resource "azurerm_resource_group" "rg" {
    name                    = "${var.customer}-${var.project}-${var.env}-rg"
    location                = var.location

    tags = merge(local.merged_tags, {
        name  = "${var.customer}-${var.project}-${var.env}-rg"
    })
}